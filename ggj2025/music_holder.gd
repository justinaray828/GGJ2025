extends Node

@export var layer1reference: AudioStreamPlayer = null
@export var layer2reference: AudioStreamPlayer = null
@export var layer3reference: AudioStreamPlayer = null
@export var layer4reference: AudioStreamPlayer = null
@export var layer5reference: AudioStreamPlayer = null

@export var metricstracker: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerSingleton.health < 1:
		layer1reference.volume_db = -80
		layer2reference.volume_db = -80
		layer3reference.volume_db = -80
		layer4reference.volume_db = -80
		layer5reference.volume_db = -80
		return
	else:
		layer1reference.volume_db = -5
	
	if(metricstracker.time_played > 16):
		layer2reference.volume_db = -5
	if(metricstracker.time_played > 32):
		layer3reference.volume_db = -5
	if(metricstracker.time_played > 48):
		layer4reference.volume_db = -5
	pass
