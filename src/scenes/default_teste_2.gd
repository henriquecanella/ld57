extends Node2D

@onready var timer := $Timer as Timer
@export var remainingTime = 10.0

func _ready() -> void:
	timer.wait_time = remainingTime
	timer.start()

func _on_set_wait_time(time: float):
	remainingTime += time
	_on_timer_timeout(true)
	
func _on_timer_timeout(restart: bool = false) -> void:
	if !restart:
		if remainingTime > 0:
			print('aconteceu algo ao timer de após o timer terminar')
			print(remainingTime)
			remainingTime -= 1.0
			timer.wait_time = remainingTime
		else:
			print('você falhou em sua missão')
			get_tree().change_scene_to_file("res://src/scenes/default_teste.tscn")
	else:
		var actual_time_lost = remainingTime-timer.time_left
		print('uma lampada foi acessa, parece que a escuridão está retrocedendo!')
		if actual_time_lost > 0.0:
			var diference_timer = (remainingTime-actual_time_lost)
			timer.wait_time = diference_timer
			print(remainingTime)
			print(timer.time_left)
		else:
			timer.wait_time = remainingTime
