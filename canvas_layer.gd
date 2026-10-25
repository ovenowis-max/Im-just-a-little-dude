extends CanvasLayer

@onready var color: ColorRect = $ColorRect

func _ready() -> void:
	color.modulate.a = 0.0

func change_scene_to(scene_path: String) -> void:
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.set_trans(Tween.TRANS_QUART)
	
	tween.tween_property(color, "modulate:a", 3.0, 0.8)
	
	tween.tween_callback(func(): 
		get_tree().change_scene_to_file(scene_path)
	)
	
	tween.tween_property(color, "modulate:a", 0.0, 0.8)
	
	tween.finished.connect(func():
		color.mouse_filter = Control.MOUSE_FILTER_IGNORE
	)
