extends Node2D

@export var mycooldowntimer: Timer = null
@export var timebetweenattacks:float = .5

@export var attack2scene: PackedScene = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("fire2")):
		#see if we can run attack 2. NEED AN AND STATEMENT IN THIS IF!
		#NEED TO CHECK IF WE HAVE THE RESOURCES TO MAKE THIS ATTACK!!!! 
		if(mycooldowntimer.is_stopped()):
			#run attack 2 code 
			var myattack = attack2scene.instantiate()
			myattack.position = get_global_mouse_position()
			get_parent().get_parent().add_child(myattack)
			#reset the timer
			mycooldowntimer.wait_time = timebetweenattacks 
			mycooldowntimer.start()
			pass
		#if the player tries to attack, but can't - lets play a sound
		else:
			pass
		pass
	pass

func _input(event: InputEvent) -> void:
	pass
	
