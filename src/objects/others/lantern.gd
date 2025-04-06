extends Node2D
class_name Lantern

@onready var player = get_tree().get_first_node_in_group("player")
@onready var ptLight: PointLight2D = get_node("Fonte")
@onready var lantern_light: bool = false

#func _ready():
	#$AnimatedSprite2D.play("off")
	#interaction_area.interact = Callable(self, "_turn_on")

func _input(event):
	if event.is_action_pressed("use_lamp") && !lantern_light:
		ptLight.enabled = true
		#$AnimatedSprite2D.play("on")
		lantern_light = true
	elif !event.is_action_pressed("use_lamp") && lantern_light:
		ptLight.enabled = false
		lantern_light = false
