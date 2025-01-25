extends CharacterBody2D
class_name Enemy

@export var speed: float = 150.0

var base_player: Node2D
var player: Node2D

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
