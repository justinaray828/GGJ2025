extends Area2D

var speed = 750
var damage = 0 
var myhealth = 1
@export var mainattackaudio: PackedScene = null
@export var popsound1: AudioStream  = null
@export var popsound2: AudioStream = null
@export var popsound3: AudioStream = null
@export var popsound4: AudioStream = null
@export var popsound5: AudioStream = null
@export var popsound6: AudioStream = null

@export var finishparticles: PackedScene = null 

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


func _on_body_entered(body: Node2D) -> void:	
	myhealth -= 1
	if(body.name == "MainPlayerController"):
		pass
	elif(body.is_in_group("Enemy")):
		body.takeDamage(damage)
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
		get_parent().add_child(mypopsound)
		mypopsound.play()
		if(myhealth <= 0):
			var finishparts = finishparticles.instantiate()
			get_parent().add_child(finishparts)
			finishparts.position = global_position
			finishparts.emitting  = true
			call_deferred("free")
	pass # Replace with function body.
