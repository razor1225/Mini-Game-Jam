extends Control

func _ready():
	MusicManager.stop()
		
func _on_start_pressed():
	$button_sound.play()
	TransitionController.change_scene("res://arena.tscn")


func _on_quit_pressed():
	$button_sound.play()
	TransitionController.change_scene("res://title_screen.tscn")
	
