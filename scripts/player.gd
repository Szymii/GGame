extends CharacterBody2D


@export var speed := 200

var input_direction := Vector2.ZERO
func read_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func update_animation():
	if(velocity == Vector2.ZERO):
		$Sprite2D/AnimationTree["parameters/conditions/iddle_to_walk"] = false
		$Sprite2D/AnimationTree["parameters/conditions/walk_to_iddle"] = true
	else:
		$Sprite2D/AnimationTree["parameters/conditions/iddle_to_walk"] = true
		$Sprite2D/AnimationTree["parameters/conditions/walk_to_iddle"] = false
		
		
	if(input_direction != Vector2.ZERO):
		$Sprite2D/AnimationTree["parameters/Iddle/blend_position"] = input_direction
		$Sprite2D/AnimationTree["parameters/Walk/blend_position"] = input_direction

	
func _ready():
	$Sprite2D/AnimationTree.active = true

func _physics_process(delta):
	read_input()
	update_animation()
	velocity.normalized()
	move_and_slide()
	
