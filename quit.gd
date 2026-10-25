extends TextureButton

var speed : float = 10
var on : bool = false

func _on_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	if on:
		offset_transform_scale = offset_transform_scale.lerp(Vector2(1.3,1.3), speed * delta)
	elif not on:
		offset_transform_scale = offset_transform_scale.lerp(Vector2(1,1), speed * delta)

func _on_mouse_entered() -> void:
	on = true
	
func _on_mouse_exited() -> void:
	on = false
