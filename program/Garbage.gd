extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var nr = round(rand_range(1,5))
	if(nr == 1):
		$AnimatedSprite.animation = "1"
	if(nr == 2):
		$AnimatedSprite.animation = "2"
	if(nr == 3):
		$AnimatedSprite.animation = "3"
	if(nr == 4):
		$AnimatedSprite.animation = "4"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
