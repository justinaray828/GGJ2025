extends Node

var movement_player_reference: CharacterBody2D = null

#random number, we can change the health 
#if this number goes to 0, pause the game, run player death anim, show score 
var health: int = 5

func _process(delta: float) -> void:
	pass
func _input(event: InputEvent) -> void:
	#REMOVE THIS! THIS IS A DEBUG EVENT SO IF THE PLAYER FIRES, WE RUN THE TAKE DAMAGE STUFF 
	if (event.is_action_pressed("fire1")):
		runTakeDamageLogic(1)


#Take damage function 
func runTakeDamageLogic(damage: float): 
	if(movement_player_reference == null):
		movement_player_reference = get_tree().get_first_node_in_group("MainCharacterController")
	if movement_player_reference != null:
		health = health-1
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

func commitUpgrade(identifier: int):
	print("UPDATING: THIS ONE: " + str(identifier))
	match identifier:
		0:
			movement_player_reference.speed += 50
		1:
			baseattack1amtfired += 1
		2: 
			baseattack1damage  += 1 
		3:
			baseattack1size += .3		
		4:
			baseattack1timer -= .15
		5:
			baseattack1speed += 100
			baseattack1health +=1 
