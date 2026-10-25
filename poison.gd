extends Area2D

var timer : float = 0
var dialog : bool = false

func _ready() -> void:
	body_entered.connect(_on_collision)
	
func _on_collision(body: CharacterBody2D):
	if "haspoison" in body and not dialog and not body.haspoison:
		body.haspoison = true
		visible = false

func _on_level_1_loss() -> void:
	var player : CharacterBody2D = $"../player"
	if not visible:
		player.haspoison = false
		global_position = player.global_position
		visible = true
		dialog = true
func _on_path_follow_2d_dialog_ended() -> void:
	dialog = false

func consume():
	if not visible:
		queue_free()
