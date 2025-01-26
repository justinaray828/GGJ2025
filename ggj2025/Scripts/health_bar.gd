extends HBoxContainer
@onready var health_bar: HBoxContainer = $"."

var hearts: Array[TextureRect]

func setup_heart_display():
	for heart_box in health_bar.get_children():
		hearts.append(heart_box)

func update_heart_display():
	print("updating health: ", PlayerSingleton.health)
	print("Hearts Size", hearts.size())
	for i in range(hearts.size()):
		hearts[i].visible = i < PlayerSingleton.health

func _ready() -> void:
	setup_heart_display()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
