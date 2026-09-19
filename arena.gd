extends Node2D

var corn_enemy_scene = preload("res://corn_enemy.tscn")


func random_spawn():
	var current_spawnpoint = randi() % 4
	match current_spawnpoint:
		0: return Vector2(200, 50)  
		1: return Vector2(350, 150)
		2: return Vector2(200, 250)   
		3: return Vector2(50, 150)
	
func _on_spawn_timer_timeout():
	var corn_enemy = corn_enemy_scene.instantiate()
	corn_enemy.position = random_spawn()
	add_child(corn_enemy)
	
	
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
