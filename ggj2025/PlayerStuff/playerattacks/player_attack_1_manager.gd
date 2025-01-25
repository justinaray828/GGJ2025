extends Node2D
#Remember: 
#-look at player mouse
#automatically shoot 

var attack1speed: float = 90
@export var attack1attacktimer: Timer = null
@export var attack1baseobject: PackedScene = null

@export var mainattackaudio: PackedScene = null
@export var popsound1: AudioStream  = null
@export var popsound2: AudioStream = null
@export var popsound3: AudioStream = null
@export var popsound4: AudioStream = null
@export var popsound5: AudioStream = null
@export var popsound6: AudioStream = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reassignvalues():
	attack1speed = PlayerSingleton.baseattack1timer 
	#now for other valuesz1

	pass

func _on_attack_1_timer_timeout() -> void:
	#Throw out the bubble attack 
	#Play random sound effect - NOTE: NOW ITS JUST 1 SOUND EFFECT! LATER WE WILL HAVE MORE 
	var playthissound = randi_range(1,6)
	var mypopsound = mainattackaudio.instantiate()
	match playthissound:
		1:
			mypopsound.stream = popsound1
		2:
			mypopsound.stream = popsound2
		3:
			mypopsound.stream = popsound3
		4:
			mypopsound.stream = popsound4
		5:
			mypopsound.stream = popsound5
		6:
			mypopsound.stream = popsound6
	add_child(mypopsound)
	mypopsound.play()
	var myattack = attack1baseobject.instantiate()
	myattack.transform = get_parent().global_transform
	get_parent().get_parent().add_child(myattack)
	attack1attacktimer.wait_time = PlayerSingleton.baseattack1timer
	attack1attacktimer.start()
	pass # Replace with function body.
