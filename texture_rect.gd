extends TextureRect

var posy : float
var time : float = 0

func _ready() -> void:
	posy = position.y

func _process(delta: float) -> void:
	time += delta
	offset_transform_position.y = posy + sin(time * 3) * 5 
