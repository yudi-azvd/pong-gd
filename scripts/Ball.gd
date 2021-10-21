extends Area2D

class_name Ball

# Vector points in direction of movement
export var direction = Vector2.LEFT

const _initial_speed = 200
var _initial_pos
var _speed = _initial_speed
var _can_move = true


func _ready():
	_initial_pos = position


func _process(delta):
	if not _can_move:
		return
		
	_speed += delta * 2
	position += _speed * delta * direction


func reset():
	direction = Vector2.LEFT
	position = _initial_pos
	_speed = _initial_speed
