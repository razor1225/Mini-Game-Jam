extends CharacterBody2D
class_name BrocoliBoss

var player = null
@onready var enemy_bullet_scene = load("res://enemy_bullet.tscn")

var brocoli_right = preload("res://broccoli_front.png")
var brocoli_up = preload("res://broccoli_back.png")

@export var speed = 20
@export var health = 10

var direction = Vector2.ZERO

func _ready():
	await get_tree().create_timer(0.5).timeout
	if player == null:
		return
	direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	$shoottimer.start()
	$firerate.start()
	
func _physics_process(delta):
	if player == null:
		return
	direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
		
	
	
	
	
	
	
	
	
	if abs(velocity.y) > abs(velocity.x):
		$Sprite2D.texture = brocoli_up
	else:
		$Sprite2D.texture = brocoli_right
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
	if player == null:
		return
	var aim = global_position.direction_to(player.global_position)
	var enemy_bullet = enemy_bullet_scene.instantiate()
	enemy_bullet.position = global_position
	enemy_bullet.direction = aim
	enemy_bullet.rotation = aim.angle()
	get_parent().add_child(enemy_bullet)
	
func fire_mirror():
	var aim = -(global_position.direction_to(player.global_position))
	var enemy_bullet = enemy_bullet_scene.instantiate()
	enemy_bullet.position = global_position
	enemy_bullet.direction = aim
	enemy_bullet.rotation = aim.angle()
	get_parent().add_child(enemy_bullet)
	
#func _on_movetimer_timeout():
	#moving = false
	#$shoottimer.start()
	#$firerate.start()
	#
	

func _on_shoottimer_timeout():
	$firerate.stop()
	$pausetimer.start()


func _on_firerate_timeout():
	fire_at_player()
	fire_mirror()


func _on_pausetimer_timeout():
	$shoottimer.start()
	$firerate.start()
