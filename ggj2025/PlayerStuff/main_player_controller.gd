extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
@export var takedamagesound: AudioStreamPlayer2D = null



func _physics_process(delta):
	look_at(get_global_mouse_position())
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

#This is for what the player node 
func PlayerDamageChanges(): 
	takedamagesound.DamageSound()
	#TODO add function for looking at thealth and scaling player 
