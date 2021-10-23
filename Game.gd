extends Node2D

class_name Game

enum State {
	PRESENT_WINNER,
	BALL_MINI_DELAY
}


export var player1score := 0
export var player2score := 0
var scoreBoard: ScoreBoard
const max_score := 5
var gameState: int

func _ready():
	scoreBoard = get_node("ScoreBoard")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass	

func _on_ball_touched_wall(wall: String):
	if wall == "left":
		scoreBoard.increment_score(2)
		player2score += 1
	else:
		scoreBoard.increment_score(1)
		player1score += 1
	
	if player2score == max_score or player1score == max_score:
		gameState = State.PRESENT_WINNER
