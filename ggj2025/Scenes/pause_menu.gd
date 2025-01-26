extends MarginContainer

var is_paused = false

@onready var restart_button: Button = $"MarginContainer/Container/VBoxContainer/Restart Button"


func _ready():
	# Ensure the pause menu is hidden initially
	hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" is usually mapped to the Escape key
		toggle_pause_menu()

func toggle_pause_menu():
	is_paused = !is_paused
	
	if is_paused:
		restart_button.grab_focus()

	get_tree().paused = is_paused
	visible = is_paused

func _on_tree_exiting() -> void:
	get_tree().paused = false;
