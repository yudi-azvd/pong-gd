tool
extends Node2D

var ball: Ball
export var is_ctrl_pressed := false
export var vec_start: Vector2
export var vec_end: Vector2
export var new_ball_dir: Vector2
export var is_mouse_button_clicked: bool
export var vec_color := Color(1, 1, 1)
export var vec_width := 2.0

func _ready():
	ball = get_parent().get_node("Ball")


func _process(_delta):
	if is_ctrl_pressed:
		var mouse_pos = get_global_mouse_position()
		ball.position = mouse_pos

	update()


func _input(event: InputEvent):
	if event is InputEventMouseMotion and is_mouse_button_clicked:
		vec_end = get_local_mouse_position()
		new_ball_dir = (vec_end - vec_start).normalized()

	if event is InputEventKey:
		if (event as InputEventKey).scancode == KEY_CONTROL:
			is_ctrl_pressed = true
			
	if event.is_action_pressed('ui_debug'):
		if event is InputEventMouseButton:
			is_mouse_button_clicked = true
			vec_start = ball.position
		

	if event.is_action_released('ui_debug'):
		if event is InputEventMouseButton:
			is_mouse_button_clicked = false
			vec_end = get_global_mouse_position()
			new_ball_dir = (vec_end - vec_start).normalized()
			ball.direction = new_ball_dir

		if event is InputEventKey:
			if (event as InputEventKey).scancode == KEY_CONTROL:
				is_ctrl_pressed = false
			
			if (event as InputEventKey).scancode == KEY_SPACE:
				ball._can_move = not ball._can_move
			
			if (event as InputEventKey).scancode == KEY_R:
				ball.reset()

				
func _draw():
	draw_line(vec_start, vec_end, vec_color, vec_width, true)
