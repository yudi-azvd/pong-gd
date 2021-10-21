extends Area2D

const speed := 200
var _ball_dir: int
var _up: String
var _down: String

func _ready():
	var _name = name.to_lower()
	_up = _name + "_move_up"
	_down = _name + "_move_down"
	if _name == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1
	

func _process(delta):
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position += Vector2(0, input * speed * delta)
	position.y = clamp(position.y, 16, get_viewport().size.y - 16)


func _on_area_entered(area: Area2D):
	if area.name != "Ball":
		return

	var ball: Ball = area
	var collision_node: CollisionShape2D = self.get_node('Collision')
	var rect: RectangleShape2D = collision_node.shape
	var paddle_height = rect.extents.y
	# print('paddle height ', paddle_height)
	var hit_height_normalized = (ball.position.y - position.y) / paddle_height
	print('hit height norm ', hit_height_normalized) # mais ou menos
	var rotate_angle = lerp(-30, 30, hit_height_normalized+0.5)
	print('rotate angle ', rotate_angle, '°') # mais ou menos
	
	ball.direction = Vector2(_ball_dir, 0)
	ball.direction = ball.direction.rotated(rotate_angle*PI/180)
	print()
	# print('new vector '+ var2str(ball.direction))
