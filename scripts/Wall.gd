extends Area2D

signal ball_touched_wall(wall)

func _on_area_entered(area: Area2D):
	if area.name == 'Ball':
		area.reset()
		if name == "LeftWall":
			emit_signal("ball_touched_wall", "left")
		else:
			emit_signal("ball_touched_wall", "right")
