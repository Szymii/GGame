class_name BaseScene extends Node

@onready var player := $Player
@onready var entrance_markers: Node2D = $EntranceMarker

func _ready():
	if scene_menager.player:
		if player:
			player.queue_free()

		player = scene_menager.player
		add_child(player)
		
	position_player()

func position_player():
	for entrance in entrance_markers.get_children():
		if entrance.name == "any":
			player.global_position = entrance.global_position
			break
