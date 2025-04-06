extends Node2D
class_name Lamp

@export var _scenePath: NodePath
@onready var scene = get_node(_scenePath)
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var lamp_light: bool = false

func _ready():
	$AnimatedSprite2D.play("off")
	interaction_area.interact = Callable(self, "_turn_on")

func _turn_on():
	if !lamp_light:
		$AnimatedSprite2D.play("on")
		scene._on_set_wait_time(10)
		lamp_light = true
