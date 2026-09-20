extends Node2D

var brocoli_boss_scene = preload("res://potato_enemy.tscn")
var kill_counter = 0

func _on_spawn_timer_timeout():
	var brocoli = brocoli_boss_scene.instantiate()
	brocoli.position = Vector2(320, 180)
	brocoli.player = $tomato_man
	add_child(brocoli)


func _process(delta: float) -> void:
	if brocoli.health = 0:
		
