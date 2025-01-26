extends Node

var movement_player_reference: CharacterBody2D = null

#random number, we can change the health 
#if this number goes to 0, pause the game, run player death anim, show score 
var health: int = 5

func _process(delta: float) -> void:
	pass

#Take damage function 
func runTakeDamageLogic(damage: float): 
	if(movement_player_reference == null):
		movement_player_reference = get_tree().get_first_node_in_group("MainCharacterController")
	if movement_player_reference != null:
		if health-damage > 5:
			return # Don't add health if it would exceed 5
		health = health-damage
		if(health>0):
			movement_player_reference.PlayerDamageChanges()
		elif(health <= 0):
			movement_player_reference.PlayerDeath()
	
	
#attack 1 stats
#NOTE: IF WE ARE CALLING IN UPGRADE MENU - it should reference this script to update values 
var baseattack1timer: float = .7
var baseattack1amtfired: int = 1
var baseattack1damage: float = 1
var baseattack1size: float = 1
var baseattack1speed: float = 750 
var baseattack1health: float = 1
#attack 2 stats 

func resetAll(): 
	health = 5
	baseattack1timer= .7
	baseattack1amtfired = 1
	baseattack1damage  = 1
	baseattack1size  = 1
	baseattack1speed  = 750 
	baseattack1health = 1

func commitUpgrade(identifier: int):
	print("UPDATING: THIS ONE: " + str(identifier))
	
	if(movement_player_reference == null):
		movement_player_reference = get_tree().get_first_node_in_group("MainCharacterController")
	
	match identifier:
		1:
			movement_player_reference.speed += 50
		2:
			baseattack1timer -= .15
		3: 
			baseattack1damage  += 1 
		4:
			pass
		5:
			baseattack1size += .3
		6:
			baseattack1speed += 100
		7:
			baseattack1amtfired += 1
		8:
			baseattack1health +=1 
