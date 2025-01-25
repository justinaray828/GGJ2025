extends Area2D

var speed = 750
#var playerpos = null
func _ready():
	#transform = get_parent().global_transform
	pass
	
func _physics_process(delta):
	position += transform.x * speed * delta

#add logic for popping


func _on_existing_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_movement_timer_timeout() -> void:
	if(speed - 100 < 0):
		speed =0
	else:
		speed = speed - 100
	
	pass # Replace with function body.
