extends CharacterBody2D
 
# speed in pixels/sec
var speed = 100 
var current_dir = Vector2.ZERO


func _physics_process(_delta):
	# setup direction of movement
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0, -speed)
		current_dir = velocity
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0, speed)
		current_dir = velocity
	elif Input.is_action_pressed("ui_left"):
		velocity = Vector2(-speed, 0)
		current_dir = velocity
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2(speed, 0)
		current_dir = velocity
	else:
		velocity = Vector2.ZERO
		

	
	#call functions
	animation_handler()
	move_and_slide()

func animation_handler():
	if current_dir.x > 0:
		$AnimatedSprite2D.play("idle_right" if velocity == Vector2.ZERO else "walk_right")
	elif current_dir.x < 0:
		$AnimatedSprite2D.play("idle_left" if velocity == Vector2.ZERO else "walk_left")
	elif current_dir.y > 0:
		$AnimatedSprite2D.play("idle_down" if velocity == Vector2.ZERO else"walk_down")
	elif current_dir.y < 0:
		$AnimatedSprite2D.play("idle_up" if velocity == Vector2.ZERO else"walk_up")
	
