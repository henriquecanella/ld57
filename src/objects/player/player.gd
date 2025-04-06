extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 80.0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity + delta
		
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = jump_velocity
		
	var direction = Input.get_axis("move_left", "move_right")
	var jumping = Input.is_action_just_pressed("move_up")
	
	if direction:
		velocity.x = direction * speed
		$AnimatedSprite2D.play("walk")
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	elif jumping:
		$AnimatedSprite2D.play("up")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()

#func _on_body_entered(body):
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
#
#func start(pos):
	#position = pos
	#show()
	#$CollisionShape2D.disabled = false
