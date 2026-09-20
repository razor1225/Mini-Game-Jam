extends Node2D

var potato_enemy_scene = preload("res://potato_enemy.tscn")
var enemy_counter = 0
var kill_counter = 0

func random_spawn():
	var current_spawnpoint = randi() % 4
	match current_spawnpoint:
		0: return Vector2(160, 50)  
		1: return Vector2(175, 30)
		2: return Vector2(310, 150)
		3: return Vector2(175, 260)
	
	
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
		TransitionController.change_scene("res://arena3.tscn")
