extends Node2D
class_name Lantern

@onready var pointLight: PointLight2D = get_node("Fonte")
@onready var lantern_light: bool = false

func _flip_light(vetor: Vector2):
	pointLight.scale = vetor

func _process(delta: float):
	if Input.is_action_pressed("use_lamp") && !lantern_light:
		pointLight.enabled = true
		lantern_light = true
	elif !Input.is_action_pressed("use_lamp") && lantern_light:
		pointLight.enabled = false
		lantern_light = false
