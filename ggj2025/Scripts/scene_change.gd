extends Button

# Export the PackedScene type so it can be set in the inspector
@export var my_scene : PackedScene
@export var quit: bool = false

func _on_pressed() -> void:
	if quit:
		get_tree().quit
	else:
		get_tree().change_scene_to_packed(my_scene)
