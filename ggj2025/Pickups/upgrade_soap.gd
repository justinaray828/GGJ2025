extends Area2D

var upgrade_menu: UpgradeMenu

func _on_body_entered(body):
	if(body.is_in_group("MainCharacterController")):
		upgrade_menu.unhide()
		queue_free()
