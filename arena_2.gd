extends Node2D

var potato_enemy_scene = preload("res://potato_enemy.tscn")
var enemy_counter = 0
var kill_counter = 0

func random_spawn():
	var current_spawnpoint = randi() % 4
	match current_spawnpoint:
		0: return Vector2(200, 50)  
		1: return Vector2(350, 150)
		2: return Vector2(200, 250)   
		3: return Vector2(50, 150)
	
func _on_spawn_timer_timeout():
	var potato_enemy = potato_enemy_scene.instantiate()
	potato_enemy.position = random_spawn()
	potato_enemy.player = $tomato_man
	add_child(potato_enemy)
	enemy_counter += 1
	print(enemy_counter)
	
	if enemy_counter >= 5:
		$spawn_timer.stop()
	
func _process(delta: float):
	if kill_counter >= 5:
		get_tree().change_scene_to_file("res://arena2.tscn")
