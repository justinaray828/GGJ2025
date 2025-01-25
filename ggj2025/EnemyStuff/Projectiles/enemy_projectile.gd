extends Area2D

@export var speed: float = 750

var damage: float = 1

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_existing_timer_timeout():
	queue_free()


func _on_movement_timer_timeout():
	if(speed - 100 < 0):
		speed = 0
	else:
		speed = speed - 100

func _on_body_entered(body):
	if(body.is_in_group("MainCharacterController")):
		PlayerSingleton.runTakeDamageLogic(damage)
