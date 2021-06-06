extends Node
var points = 0
var timespeed = 60
var time = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	$SpeedTimer.start()
	$SpeedTimer.wait_time = 60
	$GameTimer.start()
	$FruitTimer.start()
	$Timer.start()



#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_just_pressed("leave")):
		get_tree().change_scene(("res://Main.tscn"))
	if(Input.is_action_just_pressed("new_game")):
		get_tree().reload_current_scene()
	$Text.text = str(points)

func _on_Player_catched():
	if($FruitPositions.object_typ == "fruit"):
		points+=5
	if($FruitPositions.object_typ == "garbage"):
		points-=5
		if(points<0):
			_game_over()
		$Player.speed -= 50
		if ($Player.speed<0):
			$Player.speed = 0
			_game_over()
	$FruitPositions.remove_child($FruitPositions.clone)

func _game_over():
	$FinishHUD._game_over()
	$SpeedTimer.stop()
	$Timer.stop()
	$FruitTimer.stop()
	$Player._game_over()
	$Text.hide()
	$Time.hide()
	$NewGameText.visible = true

func _win():
	$FinishHUD._win()
	$SpeedTimer.stop()
	$Timer.stop()
	$FruitTimer.stop()
	$Player._game_over()
	$Text.hide()
	$Time.hide()
	$NewGameText.visible = true

func _on_FruitTimer_timeout():
	$FruitPositions.spawn()
	$FruitTimer.start()


func _on_SpeedTimer_timeout():
	if(($SpeedTimer.wait_time-20) < 10):
		$SpeedTimer.wait_time = 5
	else:
		$SpeedTimer.wait_time -= 20
	if(($Player.speed - 10)<=65):
		$Player.speed = 65
	else:
		$Player.speed -= 10
	timespeed = $SpeedTimer.wait_time
	$SpeedTimer.start()

func _on_GamerTimer_timeout():
	_win()


func _on_Timer_timeout():
	timespeed-=1
	time-=1
	$Time.text = str(time)
	$Time2.text = str(timespeed)
	$Timer.start()
