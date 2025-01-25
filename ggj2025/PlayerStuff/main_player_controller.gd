extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
