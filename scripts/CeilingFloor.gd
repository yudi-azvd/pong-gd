extends Area2D

signal ball_touched_wall(wall)

var _bounce_direction = -1

func _ready():
  if name.to_lower() == 'ceiling':
    _bounce_direction = 1

func _on_area_entered(area: Area2D):
  if area.name == "Ball":
    emit_signal('ball_touched_wall', 'ceiling/floor')
    area.direction = (area.direction \
      + Vector2(0, _bounce_direction) as Vector2).normalized()