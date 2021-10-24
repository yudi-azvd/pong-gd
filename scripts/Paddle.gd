extends Area2D

class_name Paddle

const speed := 350
var _ball_dir: int
var _up: String
var _down: String
var audio_player_hit: AudioStreamPlayer
var normal: Vector2
var paddle_height: float

func _ready():
	audio_player_hit = $"../AudioPlayerHit"
	paddle_height = $Collision.shape.extents.y*2

	var _name = name.to_lower()
	_up = _name + "_move_up"
	_down = _name + "_move_down"
	if _name == "left":
		_ball_dir = 1
		normal = Vector2.RIGHT
	else:
		_ball_dir = -1
		normal = Vector2.LEFT
	

func _process(delta):
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position += Vector2(0, input * speed * delta)
	position.y = clamp(position.y, 16, get_viewport().size.y - 16)


func _on_area_entered(area: Area2D):
	if area.name != "Ball":
		return
	
	audio_player_hit.play()
	
	var ball: Ball = area
	var paddle_touch_point_relative_to_center = ball.position.y - position.y
	var paddle_touch_point_0_1 = (paddle_touch_point_relative_to_center / paddle_height + 1) / 2
	var rotate_angle = lerp(-45, 45, paddle_touch_point_0_1)
	var rotate_angle_radians = deg2rad(rotate_angle)
	var new_ball_dir = normal.rotated(rotate_angle_radians)
	
	ball.direction = Vector2(_ball_dir, _ball_dir*new_ball_dir.y)

	# A bola pode ficar tão rápida que passa direto pela raquete
	ball.speed = ball.speed * 1.02

	print('hit height      ', ball.position.y - position.y)
	print('hit height norm ', paddle_touch_point_0_1)
	print('rotate angle    ', rotate_angle, '°')
	print('new ball dir    ', ball.direction )
	print('ball speed      ', ball.speed)
	print()
