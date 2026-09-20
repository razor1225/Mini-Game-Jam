extends Control

func _on_start_pressed():
	$button_sound.play()
	get_tree().change_scene_to_file("res://arena.tscn")


func _on_quit_pressed():
	$button_sound.play()
	get_tree().change_scene_to_file("res://title_screen.tscn")
	
