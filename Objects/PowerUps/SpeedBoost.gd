extends Area2D



func _on_SpeedBoost_body_entered(body):
	print("hi")
	if body.paddle:
		body.paddle.SPEED *= 2
		queue_free()

