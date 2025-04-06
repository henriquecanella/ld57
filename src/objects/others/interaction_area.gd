extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@onready var activateLabel: bool = true
@onready var textLabel: String = ""

var interact: Callable = func():
	pass

func _on_body_entered(body: Node2D, textLabel: String = "") -> void:
	InteractionManager.register_area(self, textLabel)

func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unregister_area(self)
	
func _set_context_label(text: String):
	InteractionManager._set_label_text(text)

func _activate_label():
	activateLabel = !activateLabel
