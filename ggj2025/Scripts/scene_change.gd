extends Button

# Export the PackedScene type so it can be set in the inspector
@export var quit: bool = true
@export var game_scene: bool = false
@export var main_menu: bool = false

func _on_pressed() -> void:
	if quit:
		get_tree().quit
	if game_scene:
		get_tree().change_scene_to_file("res://TestWorld.tscn")
	if main_menu:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
