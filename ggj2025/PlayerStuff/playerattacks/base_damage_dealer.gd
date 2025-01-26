extends Area2D

var damage:int = 0
var linger: float = 0

@export var popsound: PackedScene = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$lingertimer.wait_time = linger
	var mypop = popsound.instantiate()
	mypop.position = global_position
	get_parent().add_child(mypop)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lingertimer_timeout() -> void:
	call_deferred("free")
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Enemy")):
		body.takeDamage(damage)
	pass # Replace with function body.
