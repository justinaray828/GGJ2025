extends MarginContainer

var upgrades: Dictionary = {
	1: "Movement Speed",
	2: "Bubble Frequency",
	3: "Bubble Shotgun",
	4: "Bubble Turret"
	}
	
var upgrade_1: String = ""
var upgrade_2: String = ""
var upgrade_3: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var upgrade_array = upgrades.keys()
	upgrade_array.shuffle()
	$MarginContainer/Container/VBoxContainer/choice_1.text = upgrades[upgrade_array[0]]
	$MarginContainer/Container/VBoxContainer/choice_2.text = upgrades[upgrade_array[1]]
	$MarginContainer/Container/VBoxContainer/choice_3.text = upgrades[upgrade_array[2]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_choice_1_pressed() -> void:
	pass
	
func _on_choice_2_pressed() -> void:
	pass # Replace with function body.

func _on_choice_3_pressed() -> void:
	pass # Replace with function body.
