extends MarginContainer

var is_paused = false

func _ready():
	# Ensure the pause menu is hidden initially
	hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" is usually mapped to the Escape key
		toggle_pause_menu()

func toggle_pause_menu():
	is_paused = !is_paused

	get_tree().paused = is_paused
	visible = is_paused

func _on_tree_exiting() -> void:
	get_tree().paused = false;
