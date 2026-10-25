extends CharacterBody2D

@export var speed : float = 200
@export var lifes : int = 3
@onready var initial_pos = global_position
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var haspoison : bool = false
var dialog : bool = false
var end : bool = false

var last_direction : String = "front"

func _physics_process(delta: float) -> void:
	if not dialog and not end:
		var direction := Input.get_vector("left", "right", "up", "down")
		velocity = direction * speed
		
		update_animations(direction)
		
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		animated_sprite.play("idle" + last_direction)

func update_animations(direction: Vector2) -> void:
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("walkright")
				last_direction = "right"
			else:
				animated_sprite.play("walkleft")
				last_direction = "left"
		else:
			if direction.y > 0:
				animated_sprite.play("walkfront")
				last_direction = "front"
			else:
				animated_sprite.play("walkback")
				last_direction = "back"
	else:
		animated_sprite.play("idle" + last_direction)

func _on_path_follow_2d_dialog_ended() -> void:
	lifes -= 1
	if lifes <= 0:
		Transition.change_scene_to("res://gameover.tscn")
	else:
		global_position = initial_pos
		dialog = false

func _on_level_1_loss() -> void:
	dialog = true

func _on_v_box_container_win() -> void:
	end = true
