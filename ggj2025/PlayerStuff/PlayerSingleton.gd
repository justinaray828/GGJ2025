extends Node

var movement_player_reference: CharacterBody2D = null

#random number, we can change the health 
var health: int = 7

func _process(delta: float) -> void:
	if(movement_player_reference == null):
		movement_player_reference = get_tree().get_first_node_in_group("MainCharacterController")

func _input(event: InputEvent) -> void:
	#REMOVE THIS! THIS IS A DEBUG EVENT SO IF THE PLAYER FIRES, WE RUN THE TAKE DAMAGE STUFF 
	if (event.is_action_pressed("fire1")):
		runTakeDamageLogic()


#Take damage function 
func runTakeDamageLogic(): 
	movement_player_reference.PlayerDamageChanges()
	
#attack 1 stats
#NOTE: IF WE ARE CALLING IN UPGRADE MENU - it should reference this script to update values 
var baseattack1timer: float = .7
var baseattack1damage: float = 1
var baseattack1size: float = 1

#attack 2 stats 
