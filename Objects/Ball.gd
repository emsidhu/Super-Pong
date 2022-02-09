extends KinematicBody2D

var paddle
onready var animationPlayer = $AnimationPlayer


# Member variables
var screen_size
var direction = Vector2(-1.0, 0)

# Constant for ball speed (in pixels/second)
const INITIAL_BALL_SPEED = 150
const MAX_BALL_SPEED = 600
# Speed of the ball (also in pixels/second)
var ball_speed = INITIAL_BALL_SPEED


func _ready():
	if Stats.last_scorer == "P1":
		direction.x *= -1

	screen_size = get_viewport_rect().size
	set_process(true)

func _physics_process(delta):
	
	var ball_pos = self.position
	var collision = move_and_collide(direction * ball_speed * delta)
	if ((ball_pos.y < 5 and direction.y < 0) or (ball_pos.y > screen_size.y - 5 and direction.y > 0)):
		direction.y *= -1
	
	if collision:
		animationPlayer.play("sound")
		paddle = collision.collider
		direction = paddle.position.direction_to(ball_pos)
		ball_speed = min(ball_speed * 1.1, MAX_BALL_SPEED)
		modulate = paddle.modulate
		


func hit_paddle():
	direction.x *= -1
	direction.y = randf()*2.0 - 1
	direction = direction.normalized()
	ball_speed *= 1.1
	




