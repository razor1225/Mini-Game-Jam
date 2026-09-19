extends CharacterBody2D
class_name CornEnemy

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var health: int = 2

func _ready():
	$healthbar.max_value = health
	$healthbar.value = health
	
func dmg(x):
	health -= x
	$impact.play()
	if health <= 0:
		$impact.play()
		queue_free()
