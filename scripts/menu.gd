extends Control

func _on_start_pressed():
	GlobalVars.movemnt_type = GlobalVars.JUMP.JUMP_KING
	get_tree().change_scene_to_file("res://scene/level_0.tscn")

func _on_dev_pressed():
	GlobalVars.movemnt_type = GlobalVars.JUMP.FREE
	get_tree().change_scene_to_file("res://scene/level_0.tscn")
