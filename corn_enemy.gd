extends CharacterBody2D
class_name CornEnemy
	
@export var health = 2
@export var speed = 50
var player = null

func _physics_process(delta):
	if player == null:
		return
	velocity = global_position.direction_to(player.global_position) * speed
	move_and_slide()

func dmg(x):
	health -= x
	$health.value = health
	$impact.play()
	if health <= 0:
		$impact.play()
		queue_free()
