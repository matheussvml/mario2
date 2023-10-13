extends Node2D

func _ready():
	$gameover.play()
	$AnimationPlayer.play("gameover")

func _on_gameover_finished():
	get_tree().change_scene("res://Cenas/Menu.tscn")
