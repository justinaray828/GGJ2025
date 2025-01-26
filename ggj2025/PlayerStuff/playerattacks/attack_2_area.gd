extends Area2D


var level: int = 0
var amttolevelup: int = 2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$attack2anims.play("staticbubblebreathe")
	#do different stuff for levels 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	pass # Replace with function body.

func runlevelup():
	if(level == 0):
		level = 1
		amttolevelup = 2
		$attack2anims.play("level0to1")
		 
	elif(level == 1):
		amttolevelup = 3
		level = 2
		$attack2anims.play("level1to2")
	pass


func _on_area_entered(area: Area2D) -> void:
	print("HIT BY")
	print(area.name)
	print(area.get_groups())
	if(area.is_in_group("attack1group")):
		amttolevelup -= 1
		print("LETS GET A POINT")
		if(amttolevelup <= 0):
			runlevelup()
		pass
	pass # Replace with function body.


func _on_attack_2_anims_animation_finished(anim_name: StringName) -> void:
	if(level ==1):
		$attack2anims.play("staticbubblebreathe")
	pass # Replace with function body.
