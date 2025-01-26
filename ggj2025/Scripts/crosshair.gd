extends Node

var crosshair_sprite = load("res://Assets/sprites/crosshair.png")
const ANALOG_SENSATIVITY = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(crosshair_sprite)

func _process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	
	var analog_input = Input.get_vector("cursor left", "cursor right", "cursor up", "cursor down")
	
	if abs(analog_input.x) + abs(analog_input.y) == 2:
		analog_input = analog_input.normalized()
	
	if analog_input != Vector2.ZERO:
		var movement_multiplier = ANALOG_SENSATIVITY * delta
		get_viewport().warp_mouse(mouse_position + (analog_input * movement_multiplier))
	
