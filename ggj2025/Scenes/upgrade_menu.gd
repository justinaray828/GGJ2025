extends MarginContainer
class_name UpgradeMenu

var upgrades: Dictionary = {
	1: "Movement Speed",
	2: "Bubble Bullet Frequency",
	3: "Bubble Bullet Damage",
	4: "Bubble Bomb Damage",
	6: "Bubble Bullet Speed",
	7: "Bubble Bullet Spread",
	8: "Bubble Bullet Penetration"
	}
	
var upgrade_1: String
var upgrade_2: String
var upgrade_3: String

func _on_choice_1_pressed() -> void:
	PlayerSingleton.commitUpgrade(upgrades.find_key(upgrade_1))
	get_tree().paused = false
	hide()
	
func _on_choice_2_pressed() -> void:
	PlayerSingleton.commitUpgrade(upgrades.find_key(upgrade_2))
	get_tree().paused = false
	hide()

func _on_choice_3_pressed() -> void:
	PlayerSingleton.commitUpgrade(upgrades.find_key(upgrade_3))
	get_tree().paused = false
	hide()

func unhide() -> void:
	shuffle()
	$MarginContainer/Container/VBoxContainer/choice_1.text = upgrade_1
	$MarginContainer/Container/VBoxContainer/choice_2.text = upgrade_2
	$MarginContainer/Container/VBoxContainer/choice_3.text = upgrade_3
	#unhide()
	visible = true
	get_tree().paused = true
	
func shuffle() -> void:
	var upgrade_array = upgrades.keys()
	upgrade_array.shuffle()
	upgrade_1 = upgrades[upgrade_array[0]]
	upgrade_2 = upgrades[upgrade_array[1]]
	upgrade_3 = upgrades[upgrade_array[2]]
