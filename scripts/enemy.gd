extends CharacterBody2D

var speed := 70
var player_chase := false
var player = null
var is_palyer_in_attacj_range = false

func _physics_process(delta):
	if player_chase:
		velocity = (player.get_global_position() - position).normalized() * speed * delta
		move_and_collide(velocity)

		if player.get_global_position().x < position.x:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false

func _on_detection_area_body_entered(body):
	if body.has_method("on_enemy_hit"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false

func _on_attack_rang_body_entered(body):
	if body.has_method("on_enemy_hit"):
		is_palyer_in_attacj_range = true
		body.on_enemy_hit(10)
		$attack_cd.start()

func _on_attack_rang_body_exited(_body):
	is_palyer_in_attacj_range = false
	$attack_cd.stop()

func _on_attack_cd_timeout():
	if is_palyer_in_attacj_range&&player&&player.has_method("on_enemy_hit"):
		player.on_enemy_hit(10)
