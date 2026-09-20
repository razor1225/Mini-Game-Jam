extends CharacterBody2D
class_name PotatoEnemy

var player = null
var enemy_bullet_scene = preload("res://enemy_bullet.tscn")

var potato_right = preload("res://potato_profile.png")
var potato_up = preload("res://potato_back.png")

@export var speed = 40
@export var health = 3

var moving = false
var direction = Vector2.ZERO

func _ready():
	if player == null:
		return
	moving = true
	direction = global_position.direction_to(player.global_position)
	$movetimer.start()
	
func _physics_process(delta):
	if moving == true:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
		
	
	
	
	
	
	
	
	
	if abs(velocity.y) > abs(velocity.x):
		$Sprite2D.texture = potato_up
	else:
		$Sprite2D.texture = potato_right
		$Sprite2D.flip_h = velocity.x < 0

func dmg(x):
	health -= x
	$health.value = health
	$impact.play()
	if health <= 0:
		$impact.play()
		get_parent().kill_counter += 1
		queue_free()

func fire_at_player():
	var aim = global_position.direction_to(player.global_position)
	var enemy_bullet = enemy_bullet_scene.instantiate()
	enemy_bullet.position = global_position
	enemy_bullet.direction = aim
	enemy_bullet.rotation = aim.angle()
	get_parent().add_child(enemy_bullet)
	
	
func _on_movetimer_timeout():
	moving = false
	$shoottimer.start()
	$firerate.start()
	
	

func _on_shoottimer_timeout():
	$firerate.stop()
	direction = global_position.direction_to(player.global_position)
	moving = true
	$movetimer.start()


func _on_firerate_timeout():
	fire_at_player()
