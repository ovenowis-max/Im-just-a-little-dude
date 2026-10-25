extends Node2D

@onready var music = $JuegoLoop
@onready var player : CharacterBody2D = $player
@onready var poison : Area2D = $poison
@export var maxtime : float = 80

var timer : float = 0
var cooldown : bool = false
var total : int  = 0
var dishes : int = 0
signal loss

func _ready() -> void:
	total = get_tree().get_node_count_in_group("dishes")
	music.play()

func _process(delta: float) -> void:
	timer += delta
	if timer >= maxtime:
		timer = 0
		Transition.change_scene_to("res://gameover.tscn")
	elif not cooldown:
		for grownup in get_tree().get_nodes_in_group("grownups"):
			if grownup is Area2D and grownup.overlaps_body(player) and player.haspoison: #this validation "grownup is Area2D" was made by ai, i couldnt solve what was wrong myself, sorry guys
				loss.emit()
				cooldown = true
				await get_tree().create_timer(5).timeout
				cooldown = false
				break
