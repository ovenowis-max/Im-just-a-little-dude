extends VBoxContainer

@onready var dishes : Label = $Label
@onready var time : Label = $Label2
var totaldishes := 3
var timer: float = 120

signal minusdish
signal win

func _ready() -> void: dishes.text = "Dishes Left: %d" % totaldishes

func _process(delta: float) -> void:
	timer -= delta
	time.text = "Time Left: %.0f" % timer

func _on_salad_dish_poisoned() -> void:
	minusdish.emit()
	totaldishes -= 1
	dishes.text = "Dishes Left: %d" % totaldishes
	
	await get_tree().create_timer(2.5).timeout
	if totaldishes <= 0:
		win.emit()
		Transition.change_scene_to("res://uwon.tscn")
