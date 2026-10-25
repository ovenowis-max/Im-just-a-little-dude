extends TextureProgressBar

@onready var label = $"CenterContainer/Label"

func _ready() -> void:
	max_value = 3.0
	
func _process(delta: float) -> void:
	value = 0.0
	
	for salad in get_tree().get_nodes_in_group("dishes"):
		if salad.timer > 0:
			value = salad.timer
			label.text = "%.1f Seconds" % salad.timer
			break
	if value <= 0:
		visible = false
	else: visible = true
