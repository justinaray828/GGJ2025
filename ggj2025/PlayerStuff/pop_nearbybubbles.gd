extends Node2D

var mycooldowntimer: Timer = null
var timebetweenattacks:float = .5

@export var Popnearbybubbles: PackedScene = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mycooldowntimer = $PopnearbyTimer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("fire2")):
		#see if we can run attack 2. NEED AN AND STATEMENT IN THIS IF!
		#NEED TO CHECK IF WE HAVE THE RESOURCES TO MAKE THIS ATTACK!!!
		#TODO: REMOVE HEALTH! 
		if(mycooldowntimer.is_stopped()):
			#run attack 2 code 
			var myattack = Popnearbybubbles.instantiate()
			myattack.position = get_parent().global_position
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
	
