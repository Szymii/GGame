extends Node

var player

func change_scene(from, to: String):
	player = from.player
	player.get_parent().remove_child(player)

	var new_scene_path = "res://scene/" + to + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", new_scene_path)
