extends CharacterBody2D
 
var direction: float = 0
 
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

func paly_animation():
	if direction != 0 and is_on_floor():
		animation_player.play("move")
		return

	if !is_on_floor():
		animation_player.play("jump")
		return
		
	animation_player.play("RESET")
	return

func _physics_process(_delta):
	direction = Input.get_axis("left", "right")
	
	if direction != 0:
		sprite.flip_h = (direction == - 1)
 
	paly_animation()
