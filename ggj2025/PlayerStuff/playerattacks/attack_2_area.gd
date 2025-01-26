extends Area2D


var level: int = 0
var amttolevelup: int = 2 

@export var damagehitbox: PackedScene = null 
@export var damagehitboxLinger: float = .07
@export var damageHitboxDamage: int = 1 
@export var scaleofDamgeBox: Vector2 = Vector2(1,1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$attack2anims.play("staticbubblebreathe")
	damageHitboxDamage = PlayerSingleton.basebombdamage
	damagehitboxLinger = PlayerSingleton.basebomblinger 
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
		damageHitboxDamage += 1
		damagehitboxLinger += .2
		 
	elif(level == 1):
		amttolevelup = 3
		level = 2
		$attack2anims.play("level1to2")
		damageHitboxDamage += 1
		damagehitboxLinger += .2
	pass


func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("attack1group")):
		amttolevelup -= 1
		if(amttolevelup <= 0):
			runlevelup()
		pass
	if(area.is_in_group("BubblePopper")):
		var summonthis = damagehitbox.instantiate()
		summonthis.damage =  damageHitboxDamage
		summonthis.linger = damagehitboxLinger
		summonthis.scale = scale 
		summonthis.position = global_position
		get_parent().add_child(summonthis)
		#flushing_queries = false
		set_deferred("monitoring", false)
		call_deferred('free')  

func _on_attack_2_anims_animation_finished(anim_name: StringName) -> void:
	if(level ==1):
		$attack2anims.play("staticbubblebreathe")
	elif(level == 2):
		pass
		
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	call_deferred("free")
	pass # Replace with function body.
