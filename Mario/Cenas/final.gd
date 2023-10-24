extends Node2D



func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Cenas/Menu.tscn")
		
func _ready():
	Hud.visible = false 
	$final.play()
