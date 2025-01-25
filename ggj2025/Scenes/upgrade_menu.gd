extends MarginContainer

var upgrades: Dictionary = {
	1: "Movement Speed",
	2: "Bubble Frequency",
	3: "Bubble Shotgun",
	4: "Bubble Turret"
	}
	
var upgrade_1: String
var upgrade_2: String
var upgrade_3: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_choice_1_pressed() -> void:
	#playerInumerator.commitUpgrade(upgrades.get_key(upgrade_1))
	hide()
	
func _on_choice_2_pressed() -> void:
	#playerInumerator.commitUpgrade(upgrades.get_key(upgrade_2))
	hide() # Replace with function body.

func _on_choice_3_pressed() -> void:
	#playerInumerator.commitUpgrade(upgrades.get_key(upgrade_3))
	hide() # Replace with function body.

func unhide() -> void:
	shuffle()
	$MarginContainer/Container/VBoxContainer/choice_1.text = upgrade_1
	$MarginContainer/Container/VBoxContainer/choice_2.text = upgrade_2
	$MarginContainer/Container/VBoxContainer/choice_3.text = upgrade_3
	unhide()
	
func shuffle() -> void:
	var upgrade_array = upgrades.keys()
	upgrade_array.shuffle()
	upgrade_1 = upgrades[upgrade_array[0]]
	upgrade_2 = upgrades[upgrade_array[1]]
	upgrade_3 = upgrades[upgrade_array[2]]
