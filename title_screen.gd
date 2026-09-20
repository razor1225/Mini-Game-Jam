extends Control

func _on_start_pressed():
	$button_sound.play()
	TransitionController.change_scene("res://cutscene.tscn")


func _on_quit_pressed():
	$button_sound.play()
	get_tree().quit()
	
