extends Node2D

var brocoli_boss_scene = preload("res://brocoli_boss.tscn")

var kill_counter = 0
var enemy_counter = 0

func _on_spawn_timer_timeout():
	var brocoli = brocoli_boss_scene.instantiate()
	brocoli.position = Vector2(310, 150)
	brocoli.player = $tomato_man
	add_child(brocoli)

	
func _process(delta: float):
	if kill_counter >= 1:
		TransitionController.change_scene("res://title_screen.tscn")
