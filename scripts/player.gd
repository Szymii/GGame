extends CharacterBody2D
 
var direction: float = 0
 
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

@onready var free_jump = $FreeJump
@onready var jump_king_jump = $JumpKingJump

func paly_animation():
	direction = Input.get_axis("left", "right")
	if direction != 0 and is_on_floor():
		animation_player.play("move")
		return

	if !is_on_floor():
		animation_player.play("jump")
		return
		
	animation_player.play("RESET")
	return

func _ready():
	if GlobalVars.movemnt_type == GlobalVars.JUMP.JUMP_KING:
		remove_child(free_jump)
	else:
		remove_child(jump_king_jump)

func _physics_process(_delta):
	if velocity.x != 0:
		print(velocity.x < 0)
		sprite.flip_h = (velocity.x < 0)
 
	paly_animation()
