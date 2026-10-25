extends PathFollow2D

@export var speed : float = 100
@export var waiting_time : float = 2
@export var dialog_time : float = 4
@onready var spriteanim : AnimatedSprite2D = $grownup/AnimatedSprite2D

var direction : int = 1
var waiting : bool = false
var wait_timer : float = 0
var dialog : bool = false
var end : bool = false
var lastdirection : String = "Front"

var last_position : Vector2

signal dialog_ended
signal skip

func _ready() -> void:
	last_position = global_position

func _on_level_1_loss() -> void:
	dialog = true
	await skip
	dialog = false
	dialog_ended.emit()

func _process(delta: float) -> void:
	if not dialog:
		if waiting:
			spriteanim.play(lastdirection)
			wait_timer += delta
			if wait_timer >= waiting_time:
				waiting = false
				wait_timer = 0
			last_position = global_position
			return

		progress += speed * direction * delta

		if direction == 1 and progress_ratio >= 1:
			progress_ratio = 1
			direction = -1
			waiting = true
		elif direction == -1 and progress_ratio <= 0:
			progress_ratio = 0
			direction = 1 
			waiting = true

		var current_position = global_position
		var movement_vector = current_position - last_position #this part (48-63) was made by ai, sorry
		
		if movement_vector.length_squared() > 0.001:
			if abs(movement_vector.x) > abs(movement_vector.y):
				if movement_vector.x > 0:
					spriteanim.play("walkright")
					lastdirection = "idleright"
				else:
					spriteanim.play("walkleft")
					lastdirection = "idleleft"
			else:
				if movement_vector.y > 0:
					spriteanim.play("walkfront")
					lastdirection = "idlefront"
				else:
					spriteanim.play("walkback")
					lastdirection = "idleback"
		
		last_position = current_position

	if Input.is_action_pressed("ui_accept"):
		skip.emit()

func _on_v_box_container_win() -> void:
	end = true
