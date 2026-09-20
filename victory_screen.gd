extends Node2D

func _on_quit_pressed():
	$button_sound.play()
	get_tree().quit()
