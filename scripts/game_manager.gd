extends Node

@export var score_label: Label

var score = 0

func add_point():
	score += 1
	score_label.text = "Coins: " + str(score)
