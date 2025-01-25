extends Node2D

@export var spawn_area: Rect2 = Rect2(Vector2(-100, -100), Vector2(200, 200))
@export var spawn_interval: float = 2.0
@export var object_to_spawn: PackedScene

var _time_since_last_spawn: float = 0.0

func _ready():
	# Start the process loop
	set_process(true)

func _process(delta: float):
	# Update the time since the last spawn
	_time_since_last_spawn += delta

	# Check if it's time to spawn a new object
	if _time_since_last_spawn >= spawn_interval:
		_time_since_last_spawn = 0.0
		spawn_object()

func spawn_object():
	if object_to_spawn:
		# Instance the object to spawn
		var instance = object_to_spawn.instantiate()
		
		# Generate a random position within the spawn area
		var random_position = Vector2(
			randi_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
			randi_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
		)
		
		# Place the object at the random position
		instance.position = random_position
		
		# Add the object as a child of the spawner
		add_child(instance)
	else:
		print("No object_to_spawn assigned to the spawner.")

func randi_range(min: float, max: float) -> float:
	return randf() * (max - min) + min
