extends Node2D
#Remember: 
#-look at player mouse
#automatically shoot 

var attack1speed: float = 90
@export var attack1attacktimer: Timer = null
@export var attack1baseobject: PackedScene = null
#TODO - ADD MORE AUDIO WITH ENEMIES 
@export var attacksoundeffect: AudioStreamPlayer2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_attack_1_timer_timeout() -> void:
	#Throw out the bubble attack 
	#Play random sound effect 
	for i in PlayerSingleton.baseattack1amtfired:
		var myattack = attack1baseobject.instantiate()
		myattack.damage = PlayerSingleton.baseattack1damage
		myattack.transform = get_parent().global_transform
		myattack.myhealth = PlayerSingleton.baseattack1health
		myattack.look_at(get_global_mouse_position())
		var randomx = randf_range(0,30)
		var randomy = randf_range(0,30)
		myattack.position += Vector2(randomx, randomy)
		get_parent().get_parent().add_child(myattack)
		attack1attacktimer.wait_time = PlayerSingleton.baseattack1timer
		attack1attacktimer.start()
		pass # Replace with function body.
