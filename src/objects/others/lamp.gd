extends Node2D
#extends Global
class_name Lamp

@export var _scenePath: NodePath
@export var _doorScene: NodePath
@onready var scene = get_node(_scenePath)
@onready var doorExit = get_node(_doorScene)
@onready var lampInteract = get_node("InteractionArea")
@onready var ptLight: PointLight2D = get_node("Fonte")
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var lamp_light: bool = false

func _ready():
	$AnimatedSprite2D.play("off")
	interaction_area.interact = Callable(self, "_turn_on")

func _turn_on():
	if !lamp_light:
		ptLight.enabled = true
		$AnimatedSprite2D.play("on")
		scene._on_set_wait_time(10)
		lamp_light = true
		lampInteract._activate_label()
		doorExit.lampsOn += 1
