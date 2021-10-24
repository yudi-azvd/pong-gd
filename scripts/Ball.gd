extends Area2D

class_name Ball

# Vector points in direction of movement
export var direction = Vector2.LEFT

const _initial_speed: float = 300.0
var _initial_pos
var speed: float = _initial_speed
var _can_move: bool = true


func _ready():
	_initial_pos = position


func _process(delta):
	if not _can_move:
		return
		
	speed += delta * 2
	position += speed * delta * direction


func reset():
	direction = Vector2.LEFT
	position = _initial_pos
	speed = _initial_speed
