extends Node2D
#Remember: 
#-look at player mouse
#automatically shoot 

@export var attack1speed: float = 1.3
@export var attack1attacktimer: Timer = null
@export var attack1baseobject: PackedScene = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_attack_1_timer_timeout() -> void:
	#Throw out the bubble attack 
	var myattack = attack1baseobject.instantiate()
	myattack.transform = get_parent().global_transform
	get_parent().get_parent().add_child(myattack)
	attack1attacktimer.wait_time = attack1speed
	attack1attacktimer.start()
	pass # Replace with function body.
