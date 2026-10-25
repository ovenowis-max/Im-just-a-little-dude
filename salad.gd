extends Area2D

var poisoned : bool = false
var timer : float = 0

@onready var player : CharacterBody2D = $"../player"
@onready var sprite : Sprite2D = $Sprite2D

signal dish_poisoned

func _poisoned():
	print("poison")
	get_tree().call_group("posisons", "consume")
	dish_poisoned.emit()
	poisoned = true
	timer = 0
	sprite.frame = 1
	player.haspoison = false

func _process(delta: float) -> void:
	if not player.haspoison: 
		return
	if overlaps_body(player) and not poisoned:
		if Input.is_action_pressed("poison"):
			timer += delta
		elif Input.is_action_just_released("poison"):
			timer = 0
	if timer >= 3:
		_poisoned()
