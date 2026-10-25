extends Label

@onready var player : CharacterBody2D = $"../../../player"

func _process(delta: float) -> void:
	if player:
		text = "Te quedan {w} vidas.".format({"w": player.lifes})
