extends Area2D

func _on_area_entered(area: Area2D):
  print('wall hit')
  if area.name == 'Ball':
    area.reset()