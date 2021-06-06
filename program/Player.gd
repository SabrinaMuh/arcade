extends Area2D
signal catched
export var speed = 200
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.animation = "stand"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.animation = "walk_right"
	if Input.is_action_just_released("ui_right"):
		$AnimatedSprite.animation = "stand"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.animation = "walk_left"
	if Input.is_action_just_released("ui_left"):
		$AnimatedSprite.animation = "stand"
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)


func _game_over():
	$AnimatedSprite.hide()
	$CollisionShape2D.hide()

func _on_Player_body_entered(_body):
	emit_signal("catched")

