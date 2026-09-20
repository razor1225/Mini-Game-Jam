extends CharacterBody2D

@export var speed = 80

var tomato_right = preload("res://tomato_profile_ingame.png")
var tomato_up = preload("res://tomato_back_ingame.png")
var bullet_scene = preload("res://bullet.tscn")
var looking_right = true
var can_shoot = true
@export var cooldown: float = 0.5
@export var health = 3
var invincible = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	
	if input_direction.y != 0:
		$Sprite2D.texture = tomato_up    
		
	elif input_direction.x != 0:
		$Sprite2D.texture = tomato_right
		
	if input_direction.x < 0:
		$Sprite2D.flip_h = true #left
		looking_right = false
		
	elif input_direction.x > 0:
		$Sprite2D.flip_h = false #right
		looking_right = true

func _physics_process(delta):
	get_input()
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		print("test")
		shoot()
		
func shoot():
	if can_shoot == false:
		return
		
	var mouse_direction = global_position.direction_to(get_global_mouse_position())
	
	if looking_right and mouse_direction.x < 0:
		return
	if not looking_right and mouse_direction.x > 0:
		return
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	bullet.direction = global_position.direction_to(get_global_mouse_position())
	bullet.rotation = bullet.direction.angle()
	print(global_position)
	get_parent().add_child(bullet)
	
	can_shoot = false
	await get_tree().create_timer(cooldown).timeout
	can_shoot = true
	
func take_hit(x):
	if invincible == true:
		return

	health -= x
	print("player health: ", health)
	invincible = true
	await get_tree().create_timer(1.0).timeout
	invincible = false

	#if health <= 0:
		#get_tree().reload_current_scene()
		#return
func _on_impactzone_body_entered(body: Node2D):
	print("hurtbox touched: ", body.name)
	if body is CornEnemy:
		take_hit(1)
