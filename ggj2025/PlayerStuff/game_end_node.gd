extends Panel


@export var gameendlabel: RichTextLabel = null 


var time_played: float = 0.0
var kill_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateTheText(): 
	kill_count = get_tree().get_first_node_in_group("MetricsTracker").kill_count
	var endplay = get_tree().get_first_node_in_group("MetricsTracker").get_time_played()
	#time_played = get_tree().get_first_node_in_group("MetricsTracker") 
	gameendlabel.text = "The bubble has popped! Oh no! He's doomed! \n"
	gameendlabel.text += "Just kidding. Now that he's in his gaseous form, he's even more powerful. \n"
	gameendlabel.text += "With his bubble blast -  all enemies disappear. While he's at it, he goes to the kingdom and saves them - but that's a story for another day. \n"
	
	
	gameendlabel.text += "\n You have slain: [b]" + str(kill_count) + "[/b] Enemies. Congratualations!"
	gameendlabel.text += "\n You've survived for: [b]" + endplay + "[/b].\n  Better luck next time!"
	if(kill_count > 200):
		pass
	pass

func get_time_played() -> String:
	# Convert time to hours, minutes, and secondssa
	var hours = int(time_played) / 3600
	var minutes = (int(time_played) % 3600) / 60
	var seconds = int(time_played) % 60
	return "%02d:%02d:%02d" % [hours, minutes, seconds]


func _on_gobacktomainmenu_pressed() -> void:
	get_tree().paused = false
	PlayerSingleton.resetAll()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_restart_pressed() -> void:
	get_tree().paused = false
	PlayerSingleton.resetAll()
	get_tree().reload_current_scene()
	pass # Replace with function body.
