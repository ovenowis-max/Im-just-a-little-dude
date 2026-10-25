extends TextureRect

@export var max : float = 20
@export var smooth : float = 5

var pos: Vector2

func _ready() -> void:
	pos = position

func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()

	var center = pos + (size / 2.0)
	var distance = mouse - center
	
	var movement = distance * 0.02
	movement = movement.limit_length(max)

	var target = pos + movement
	
	offset_transform_position = offset_transform_position.lerp(target, smooth * delta)
