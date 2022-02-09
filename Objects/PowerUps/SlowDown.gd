extends Area2D


func _on_SlowDown_body_entered(body):
	if body.paddle:
		body.paddle.SPEED /= 1.5
		queue_free()
