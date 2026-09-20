extends Node2D

var corn_enemy_scene = preload("res://corn_enemy.tscn")
var enemy_counter = 0
var kill_counter = 0

func _ready():
	if not MusicManager.playing:
		MusicManager.stream=preload("res://Music/arenaone_two.wav")
		MusicManager.play()
		
func random_spawn():
	var current_spawnpoint = randi() % 4
	match current_spawnpoint:
		0: return Vector2(160, 50)  
		1: return Vector2(175, 30)
		2: return Vector2(310, 150)
		3: return Vector2(175, 260)
	
func _on_spawn_timer_timeout():
	var corn_enemy = corn_enemy_scene.instantiate()
	corn_enemy.position = random_spawn()
	corn_enemy.player = $tomato_man
	add_child(corn_enemy)
	enemy_counter += 1
	print(enemy_counter)
	
	if enemy_counter >= 5:
		$spawn_timer.stop()
	
func _process(delta: float):
	if kill_counter >= 5:
		TransitionController.change_scene("res://arena2.tscn")
		
	
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

	
