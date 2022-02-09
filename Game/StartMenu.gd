extends ColorRect

var can_start = false

func _input(event):
	if event is InputEventKey and event.pressed and can_start:
		self.visible = false
		get_tree().paused = false


func _on_StartTimer_timeout():
	can_start = true
