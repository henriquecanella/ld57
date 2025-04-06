extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -500.0
@onready var lantern = get_node("lantern")
@onready var jump_hight_timer = $JumpHightTimer

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 40.0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity + delta
		
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		jump_hight_timer.start()
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
	
	if Input.is_action_pressed("use_lamp"):
		if direction and !jumping:
			lantern._flip_light(Vector2(direction,1))  
		elif !direction and jumping:
			if $AnimatedSprite2D.flip_h:
				lantern._flip_light(Vector2(-1, jumping))
			else:
				lantern._flip_light(Vector2(1, jumping))
		else:
			if $AnimatedSprite2D.flip_h:
				lantern._flip_light(Vector2(-1, 1))
			else:
				lantern._flip_light(Vector2(1, 1))
	move_and_slide()

func _on_jump_hight_timer_timeout() -> void:
	if !Input.is_action_pressed("move_up"):
		if velocity.y < -30:
			print(velocity.y)
			velocity.y = -30
			print('low jump')
	else:
		print('high jump')


#func _on_body_entered(body):
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
#
#func start(pos):
	#position = pos
	#show()
	#$CollisionShape2D.disabled = false
