extends Label

@onready var bar = $"../../"

func _process(delta: float) -> void:
	text = "%.0f/%.0f Dishes" % [bar.dishes, bar.totaldishes]
