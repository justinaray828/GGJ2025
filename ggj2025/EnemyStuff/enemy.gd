extends CharacterBody2D
class_name Enemy

@onready var attack_timer = $AttackTimer

@export var speed: float = 150.0
@export var attack_cooldown: float = 2
@export var projectile: PackedScene
@export var damage: float = 1
@export var health: int = 2 

var base_player: Node2D
var player: Node2D
var can_attack: bool = true
var player_in_range: bool = false
var metrics_tracker: MetricsTracker

func _ready():
	attack_timer.wait_time = attack_cooldown

func _process(delta):
	if can_attack && player_in_range:
		attack()

func _physics_process(delta):
	if base_player:
		player = base_player.get_node("MainPlayerController")
		if player:
			look_at(player.global_position)
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
		projectile_instance.global_transform = global_transform
		get_tree().current_scene.add_child(projectile_instance)
	else:
		print("Melee Attack!")
		PlayerSingleton.runTakeDamageLogic(damage)
	
	
	# Start attack cooldown
	can_attack = false
	attack_timer.wait_time = attack_cooldown
	attack_timer.start()

func takeDamage(damage: int):
	health -= damage
	
	if health <= 0:
		die()
		
func die():
	if metrics_tracker:
		metrics_tracker.kill_count += 1
	queue_free()
