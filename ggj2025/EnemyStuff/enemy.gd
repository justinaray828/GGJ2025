extends CharacterBody2D
class_name Enemy

@onready var attack_timer = $AttackTimer

@export var speed: float = 150.0
@export var attack_cooldown: float = 2
@export var projectile: PackedScene
@export var attack_range: float = 20
@export var damage: float = 1
var health: int =2 

var base_player: Node2D
var player: Node2D
var can_attack: bool = true
var player_in_range: bool = false

func _ready():
	attack_timer.wait_time = attack_cooldown

func _process(delta):
	if can_attack && player_in_range:
		attack()

func _physics_process(delta):
	if base_player:
		player = base_player.get_node("MainPlayerController")
		if player:
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
		# TODO: Instantiate projectile with damage.
	else:
		print("Melee Attack!")
		# TODO: Call player damage method.
		PlayerSingleton.runTakeDamageLogic(damage)
	
	
	# Start attack cooldown
	can_attack = false
	attack_timer.wait_time = attack_cooldown
	attack_timer.start()

func takeDamage(damagefromattack: int):
	pass
