extends Area2D

@onready var crown = $Crown
@onready var gg = $GG

func _on_body_entered(_body):
	crown.queue_free()
	gg.visible = true
	get_tree().paused = true
