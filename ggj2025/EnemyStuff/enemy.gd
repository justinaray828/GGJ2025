extends CharacterBody2D
class_name Enemy

@onready var attack_timer = $AttackTimer

@export var speed: float = 150.0
@export var attack_cooldown: float = 2
@export var projectile: PackedScene
@export var attack_range: float = 20

@export var base_player: Node2D # Temp
var player: Node2D
var dist_to_player: float
var can_attack: bool = true

func _ready():
	attack_timer.wait_time = attack_cooldown

func _process(delta):
	if can_attack:
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
		can_attack = true # Player entered attack area
		

func _on_attack_area_body_exited(body):
	if body == player:
		can_attack = false # Player left attack area

func attack():
	print("Attack!")
	can_attack = false
	attack_timer.wait_time = attack_cooldown
	attack_timer.start()
