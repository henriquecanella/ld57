extends Node

@onready var countLampOn = 0

func _set_lamp_on():
	countLampOn += 1
