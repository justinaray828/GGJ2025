extends CharacterBody2D
class_name Enemy

@onready var attack_timer = $AttackTimer
@onready var animation_player = $AnimationPlayer
@onready var attack_area = $AttackArea
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon_animation_player = $Weapon/WeaponAnimationPlayer
@onready var weapon_sprite_2d = $Weapon/WeaponSprite2D

@export var speed: float = 150.0
@export var attack_cooldown: float = 2
@export var projectile: PackedScene
@export var damage: float = 1
@export var health: float  = 2 

var base_player: Node2D
var player: Node2D
var can_attack: bool = true
var player_in_range: bool = false
var metrics_tracker: MetricsTracker
var upgrade_menu: UpgradeMenu
var facing_right: bool = true

func _ready():
	attack_timer.wait_time = attack_cooldown
	metrics_tracker.enemies_alive += 1

func _process(delta):
	if can_attack && player_in_range:
		attack()

func _physics_process(delta):
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
		weapon_sprite_2d.flip_h = false
		facing_right = true
	else:
		animated_sprite_2d.flip_h = true
		weapon_sprite_2d.flip_h = true
		facing_right = false
	
	if base_player:
		player = base_player.get_node("MainPlayerController")
		if player:
			attack_area.look_at(player.global_position)
			var direction = (player.global_position - global_position).normalized()
			velocity = direction * speed
			move_and_slide()
	else:
		# Stop movement if no player is set
		velocity = Vector2.ZERO

# Able to attack again
func _on_attack_timer_timeout():
	can_attack = true

func _on_attack_area_body_entered(body):
	if body == player:
		player_in_range = true # Player entered attack area

func _on_attack_area_body_exited(body):
	if body == player:
		player_in_range = false # Player left attack area

func attack():
	# TODO: Play attack anim
	
	if projectile:
		print("Ranged Attack!")
		# Instance the projectile
		var projectile_instance = projectile.instantiate()
		projectile_instance.damage = damage
		projectile_instance.global_position = global_position
		projectile_instance.global_transform = attack_area.global_transform
		var projectile_sprite = projectile_instance.find_child("Sprite2D")
		if projectile_sprite:
				projectile_instance.look_at(player.global_position)
		get_tree().current_scene.add_child(projectile_instance)
	else:
		print("Melee Attack!")
		if facing_right:
			weapon_animation_player.play("stab")
		else:
			weapon_animation_player.play("stab_left")
		PlayerSingleton.runTakeDamageLogic(damage)
	
	
	# Start attack cooldown
	can_attack = false
	attack_timer.wait_time = attack_cooldown
	attack_timer.start()

func takeDamage(damage: int):
	animation_player.play("take_damage")
	health -= damage
	
	if health <= 0:
		die()
		
func die():
	if metrics_tracker:
		metrics_tracker.kill_count += 1
	metrics_tracker.enemies_alive -= 1
	queue_free()
