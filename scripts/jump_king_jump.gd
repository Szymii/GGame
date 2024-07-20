extends CharacterBody2D

@export var speed: float = 200
@export var base_jump_height: float = 10

var is_jumping: bool = false;
var jump_direction = 1 # 1 = right, -1 = left
var jump_height: float = base_jump_height

func time_to_peak() -> float:
	return (0.05 * jump_height / 10) + 0.10

func time_to_fall() -> float:
	return (0.05 * jump_height / 10) + 0.05

func jump_velocity() -> float:
	return ((2.0 * jump_height) / time_to_peak())

func get_gravity() -> float:
	var _time_to_pick = time_to_peak()
	var _time_to_fall = time_to_fall()
	if velocity.y < 0:
		return ((2.0 * jump_height) / (_time_to_pick * _time_to_pick * 2))
	else:
		return ((2.0 * jump_height) / (_time_to_fall * _time_to_fall * 2))

func jump() -> void:
	if Input.is_action_pressed("jump") and jump_height < 100:
		jump_height += 1

	if Input.is_action_just_released("jump"):
		is_jumping = true
		velocity.y = -jump_velocity()

func set_jump_direction() -> void:
		if Input.is_action_just_pressed("left"):
			jump_direction = -1
		elif Input.is_action_just_pressed("right"):
			jump_direction = 1

func _physics_process(delta) -> void:
	if is_on_floor():
		# reset jump
		if is_jumping:
			is_jumping = false
			jump_height = base_jump_height

		# move left or right
		velocity.x = clamp(Input.get_axis("left", "right") * 100, -1.0, 1.0) * speed
		
		set_jump_direction()
		jump()
			
	else:
		velocity.y += get_gravity() * delta
		if is_jumping:
			velocity.x = jump_direction * speed / 1.5
		else:
			# fall off the edge (slight controll)
			velocity.x = clamp(Input.get_axis("left", "right") * 100, -1.0, 1.0) * speed / 4
	
	move_and_slide()
