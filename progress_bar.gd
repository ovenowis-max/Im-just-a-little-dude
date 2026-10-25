extends TextureProgressBar

var totaldishes : float = 0
var dishes : float = 0
var tween : Tween
@onready var level = get_tree().current_scene

func _process(delta: float) -> void:
	if level:
		totaldishes = level.total
		max_value = totaldishes

func _on_v_box_container_minusdish() -> void:
	dishes += 1
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "value", dishes, 2)
