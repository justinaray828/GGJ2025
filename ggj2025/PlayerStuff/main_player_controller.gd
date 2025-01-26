extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
@export var takedamagesound: AudioStreamPlayer2D = null
@export var myanimator: AnimationPlayer = null
@export var mysprite: AnimatedSprite2D = null
@onready var health_bar: HBoxContainer = %HealthBar
@onready var playerdiesound: AudioStreamPlayer2D = $playerdiesound

func _physics_process(delta):
	#look_at(get_global_mouse_position())
	var direction = Input.get_vector("left", "right", "up", "down")
	#if(direction.)
	velocity = direction * speed
	if(direction.x <  0):
		mysprite.flip_h = true
	elif(direction.x > 0):
		mysprite.flip_h = false
	if(velocity.x == 0 and velocity.y ==0):
		mysprite.stop()
	else:
		mysprite.play()
	move_and_slide()

#This is for what the player node 
func PlayerDamageChanges(): 
	myanimator.play("playertakedamage")
	if PlayerSingleton.health > 0:
		takedamagesound.DamageSound()
	health_bar.update_heart_display()
	#TODO add function for looking at thealth and scaling player 

func PlayerHealthChanges():
	health_bar.update_heart_display()

func PlayerDeath():
	speed=0
	myanimator.play("playerdeath")
	print("DIEDDDDDD")
	takedamagesound.stop()
	takedamagesound.volume_db = 0
	playerdiesound.play()
	await get_tree().create_timer(2).timeout
	get_tree().paused = true

	#TODO: SHOW DEATH RECAP AND POINTS, GO TO START 
