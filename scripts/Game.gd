extends Node2D

class_name Game

enum State {
	PRESENT_WINNER,
	BALL_MINI_DELAY
}


export var player1score := 0
export var player2score := 0
var audio_win: AudioStreamPlayer2D
var audio_lose: AudioStreamPlayer2D
var audio_wall_hit: AudioStreamPlayer
var audio_player_hit: AudioStreamPlayer
var scoreBoard: ScoreBoard
const max_score := 5
var gameState: int

func _ready():
	scoreBoard = $ScoreBoard
	audio_player_hit = $AudioPlayerHit
	# https://github.com/godotengine/godot/issues/46164#issuecomment-782367075
	audio_player_hit.stream.loop_mode = false
	audio_wall_hit = $AudioWallHit
	audio_wall_hit.stream.loop_mode = false
	audio_lose = $AudioLose
	audio_lose.stream.loop_mode = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta):
	
# 	pass	

func _on_ball_touched_wall(wall: String):
	
	if wall == "left":
		audio_lose.position.x = 0
		audio_lose.play()
		scoreBoard.increment_score(2)
		player2score += 1
	elif wall == "right":
		audio_lose.position.x = 400
		audio_lose.play()
		scoreBoard.increment_score(1)
		player1score += 1
	else: # teto ou chão
		audio_wall_hit.play()
	
	if player2score == max_score or player1score == max_score:
		gameState = State.PRESENT_WINNER
