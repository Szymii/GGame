extends TextureProgressBar

@export var jump: JumpKingJump

func get_procent_value(_value):
	var _min = jump.base_jump_height
	var _max = jump.max_jump_height

	return (_value - _min) / (_max - _min) * 100

func _ready():
	assert(jump, "JumpKingJump not assigned")

func _process(_delta):
	if jump.jump_height > jump.base_jump_height:
		visible = true
		value = get_procent_value(jump.jump_height)
	else:
		visible = false