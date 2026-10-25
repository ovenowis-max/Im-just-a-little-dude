extends TextureRect

@onready var label : Label= $"MarginContainer/VBoxContainer/Label"
@onready var namelabel : Label = $"MarginContainer/VBoxContainer/Label2"

var possibles_dialogs = [
	"Hey! What are you doing with that poison?\nYou're just a little guy, go play outside!\nLet me take that.",
	"Woah, careful kiddo! That's not a toy.\nYou're way too small to be carrying this.\nHand it over.",
	"Hold on... is that real poison?!\nWhere are your parents? Come on,\nlet's put this back before someone gets hurt.",
	"Nuh-uh, young man! Little boys shouldn't\nbe playing with deadly chemicals.\nI'm taking this away.",
	"Aww, look at you trying to carry that big bottle!\n...Wait, IS THIS POISON?!\nGive that to me right now!"
]

var possibles_names = ["Worried Adult"]

func _ready() -> void: modulate.a = 0

func _on_level_1_loss() -> void:
	modulate.a = 1
	label.text = possibles_dialogs.pick_random()
	namelabel.text = possibles_names.pick_random()

func _on_path_follow_2d_dialog_ended() -> void:
	modulate.a = 0
