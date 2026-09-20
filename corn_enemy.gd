extends CharacterBody2D
class_name CornEnemy

var corn_right = preload("res://corn_profile.png")
var corn_up = preload("res://corn_back.png")
	
@export var health = 2
@export var speed = 50
var player = null

func _physics_process(delta):
	if player == null:
		return
	velocity = global_position.direction_to(player.global_position) * speed
	move_and_slide()
	
	if abs(velocity.y) > abs(velocity.x):
		$Sprite2D.texture = corn_up
	else:
		$Sprite2D.texture = corn_right
		$Sprite2D.flip_h = velocity.x < 0

func dmg(x):
	health -= x
	$health.value = health
	$impact.play()
	if health <= 0:
		$impact.play()
		get_parent().kill_counter += 1
		queue_free()
