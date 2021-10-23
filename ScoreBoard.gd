extends Label

class_name ScoreBoard

export var player1score := 0
export var player2score := 0


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "0   0"
	pass # Replace with function body.


func increment_score(player_id: int):
	if player_id == 1:
		player1score += 1
	else:
		player2score += 1
	
	text = "%d   %d" % [player1score, player2score]
