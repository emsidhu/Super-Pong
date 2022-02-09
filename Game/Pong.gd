extends Node2D

onready var ball = $Ball
onready var screen_size = get_viewport_rect().size
onready var Startlabel = $StartMenu/StartLabel
onready var P1Score = $P1Score
onready var P2Score = $P2Score

const SpeedBoost = preload("res://Objects/PowerUps/SpeedBoost.tscn")
const SlowDown = preload("res://Objects/PowerUps/SlowDown.tscn")

func _ready():
	get_tree().paused = true
	$StartMenu.visible = true


func _physics_process(_delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()
	
	P1Score.text = str(Stats.P1_score)
	P2Score.text = str(Stats.P2_score)
	
	if Stats.last_scorer == "P1":
		Startlabel.text = "PLAYER 1 SCORED!"
	elif Stats.last_scorer == "P2":
		Startlabel.text = "PLAYER 2 SCORED!"
	else:
		Startlabel.text = "PRESS ANY BUTTON TO START"

	if ball.position.x < 0:
		Stats.last_scorer = "P2"
		Stats.P2_score += 1
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
		
	if ball.position.x > screen_size.x:
		Stats.last_scorer = "P1"
		Stats.P1_score += 1
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()



func _on_Timer_timeout():
	var powerup
	if (randi() % 2 + 1) == 1:
		powerup = SpeedBoost.instance()
	else:
		powerup = SlowDown.instance()
	self.add_child(powerup)
	powerup.global_position = Vector2(randi() % 500 + 60, randi() % 200 + 130)
