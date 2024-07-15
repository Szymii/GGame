extends Area2D

@export var connected_scene: String

func _on_body_entered(_body):
	scene_menager.change_scene(get_owner(), connected_scene)
