extends Node2D

@export var is_on: bool = true
@export var spawn_area: Rect2 = Rect2(Vector2(-900, -900), Vector2(1800, 1800))
@export var spawn_interval: float = 2.0
@export var node_to_spawn: PackedScene
@export var base_player: Node2D # TODO: Check gamemanager for player ref instead.
@export var metrics_tracker: MetricsTracker
@export var upgrade_menu: UpgradeMenu

var _time_since_last_spawn: float = 0.0
var player

func _ready():
	# Start the process loop
	set_process(true)

func _process(delta):
	if base_player:
		player = base_player.get_node("MainPlayerController")
		if player:
			global_position = player.global_position

	# Update the time since the last spawn
	_time_since_last_spawn += delta

	# Check if it's time to spawn a new object
	if _time_since_last_spawn >= spawn_interval:
		_time_since_last_spawn = 0.0
		spawn_object()

func spawn_object():
	if node_to_spawn:
		# Instance the object to spawn
		var instance = node_to_spawn.instantiate()
		
		# Calculate spawn area relative to the player
		var player_position = player.global_position
		var relative_spawn_area = Rect2(
			player_position + spawn_area.position,
			spawn_area.size
		)
		
		# Generate a random position within the spawn area
		var random_position = Vector2(
			randi_range(relative_spawn_area.position.x, relative_spawn_area.position.x + relative_spawn_area.size.x),
			randi_range(relative_spawn_area.position.y, relative_spawn_area.position.y + relative_spawn_area.size.y)
		)
		
		## Prevent spawns on player
		if player:
			if random_position.distance_to(player.global_position) < 700:
				return
		
		# Place the object at the random position
		instance.position = random_position
		
		# Handle enemies
		if instance.is_in_group("Enemy"):
			
			# Skip if enemy count exceeds limit
			if metrics_tracker.enemies_alive > 40:
				return
			
			instance.base_player = base_player
			instance.metrics_tracker = metrics_tracker
			
			# Increase enemy speed over time
			var new_speed = instance.speed + (metrics_tracker.time_played / 2)
			if new_speed < (player.speed - 20):
				instance.speed = new_speed
			instance.attack_cooldown = instance.attack_cooldown - (metrics_tracker.time_played / 1000)
			#print("Speed: " + str(instance.speed))
			#print("Attack Freq " + str(instance.attack_cooldown))
			
			# Increase spawn frequency
			spawn_interval = spawn_interval - (metrics_tracker.time_played / 2000)
		else:
			instance.upgrade_menu = upgrade_menu
			
		# Add the object as a child of the spawner
		get_tree().current_scene.add_child(instance)
		

func randi_range(min: float, max: float) -> float:
	return randf() * (max - min) + min
