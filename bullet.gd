extends Area2D

@export var speed = 250
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float):
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	print('hit')
	if body is StaticBody2D:
		queue_free()
		
	elif body is CornEnemy:
		body.dmg(1)
		queue_free()
		
	elif body is PotatoEnemy:
		body.dmg(1)
		queue_free()
		
	elif body is BrocoliBoss:
		body.dmg(1)
		queue_free()
