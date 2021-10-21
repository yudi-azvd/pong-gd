extends Area2D

var _bounce_direction = -1

func _ready():
  if name.to_lower() == 'ceiling':
    _bounce_direction = 1

func _on_area_entered(area: Area2D):
  if area.name == "Ball":
    area.direction = (area.direction \
      + Vector2(0, _bounce_direction) as Vector2).normalized()