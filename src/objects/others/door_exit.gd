extends Node2D

@onready var totalLamps = 1
@onready var lampsOn = 0
@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	#interaction_area._set_context_label("Acenda todas as lampadas para abrir o portão")
	interaction_area.interact = Callable(self, "_on_interact")
	
#func _process(delta):
	#if totalLamps == lampsOn:
		#interaction_area._on_body_entered(self, "")
	
func _on_interact():
	if totalLamps == lampsOn:
		get_tree().change_scene_to_file("res://src/scenes/default_teste.tscn")
