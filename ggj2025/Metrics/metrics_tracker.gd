extends Node2D
class_name MetricsTracker

var time_played: float = 0.0
var kill_count: int = 0

func _process(delta: float) -> void:
	# Increment time_played by the frame's delta time
	time_played += delta
	print(get_time_played())
	print(kill_count)

func get_time_played() -> String:
	# Convert time to hours, minutes, and seconds
	var hours = int(time_played) / 3600
	var minutes = (int(time_played) % 3600) / 60
	var seconds = int(time_played) % 60
	return "%02d:%02d:%02d" % [hours, minutes, seconds]
