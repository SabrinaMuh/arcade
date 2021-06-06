extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _win():
	$player_image.texture = load("res://figures/player_win.png")
	$Label.text = "YOU WIN"

func _game_over():
	$player_image.texture = load("res://figures/player_dead.png")
	$Label.text = "GAME OVER"
