extends KinematicBody2D

var motion = Vector2()
export var player = "P1"
export var SPEED = 200


func _physics_process(delta):
	if Input.is_action_pressed(player + "up"):
		motion.y = -SPEED
	elif Input.is_action_pressed(player + "down"):
		motion.y = SPEED
	else:
		motion.y = 0
	
	move_and_slide(motion)
