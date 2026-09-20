extends CanvasLayer


@export var fade_color: Color = Color.BLACK
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.color = fade_color

func change_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished

	get_tree().change_scene_to_file(target)

	# Wait one frame so the new scene is actually ready/visible
	await get_tree().process_frame

	$AnimationPlayer.play_backwards("dissolve")
	await $AnimationPlayer.animation_finished
