extends HBoxContainer

var hearts
var i : int = 2

func _ready() -> void:
	hearts = get_children()

func _on_path_follow_2d_dialog_ended() -> void:
	hearts[i].texture.region.position = Vector2(40,0)
	i -= 1
