extends Control
var tomato_disguise = preload("res://tomato_disguise.png")
var tomato_partial = preload("res://tomato_disguise_partlyblown.png")
var tomato_normal = preload("res://tomato_disguise_fullyblown.png")


var index = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func portrait():
	index += 1
	if index == 1:
		$disguise.texture = tomato_partial
	elif index == 2:
		$disguise.texture = tomato_normal
	else:
		TransitionController.change_scene("res://arena.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		portrait()
