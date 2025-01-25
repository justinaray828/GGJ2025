extends Button

# Export the PackedScene type so it can be set in the inspector
@export var my_scene : PackedScene

func _ready():
	if my_scene:
		var instance = my_scene.instance()
		add_child(instance)
