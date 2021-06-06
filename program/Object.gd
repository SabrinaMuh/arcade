extends RigidBody2D
signal not_catched
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var nr = round(rand_range(1,5))
	if(nr == 1):
		$AnimatedSprite.animation = "pear"
	if(nr == 2):
		$AnimatedSprite.animation = "banana"
	if(nr == 3):
		$AnimatedSprite.animation = "cherry"
	if(nr == 4):
		$AnimatedSprite.animation = "strawberry"
