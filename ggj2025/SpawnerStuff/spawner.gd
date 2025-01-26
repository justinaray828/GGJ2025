extends Node2D

@export var is_on: bool = true
@export var spawn_area: Rect2 = Rect2(Vector2(-300, -300), Vector2(600, 600))
@export var spawn_interval: float = 2.0
@export var node_to_spawn: PackedScene
@export var base_player: Node2D # TODO: Check gamemanager for player ref instead.
@export var metrics_tracker: MetricsTracker
@export var upgrade_menu: UpgradeMenu

var _time_since_last_spawn: float = 0.0

func _ready():
	# Start the process loop
	set_process(true)

func _process(delta):
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
		
		# Generate a random position within the spawn area
		var random_position = Vector2(
			randi_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
			randi_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
		)
		
		# Place the object at the random position
		instance.position = random_position
		
		# Handle enemies
		if instance.is_in_group("Enemy"):
			
			# Skip if enemy count exceeds limit
			if metrics_tracker.enemies_alive > 30:
				return
			
			instance.base_player = base_player
			instance.metrics_tracker = metrics_tracker
			instance.upgrade_menu = upgrade_menu
			
			# Increase enemy speed over time
			instance.speed = instance.speed + (metrics_tracker.time_played / 5)
			instance.attack_cooldown = instance.attack_cooldown - (metrics_tracker.time_played / 1000)
			
			# Increase spawn frequency
			spawn_interval = spawn_interval - (metrics_tracker.time_played / 2000)
		
		# Add the object as a child of the spawner
		add_child(instance)
		
	else:
		print("No object_to_spawn assigned to the spawner.")

func randi_range(min: float, max: float) -> float:
	return randf() * (max - min) + min
