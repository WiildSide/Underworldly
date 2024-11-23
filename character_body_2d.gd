extends CharacterBody2D
@export var speed = 400
const JUMP_VELOCITY = -600.0
var jumps: int = 2
#func get_input():
	#var input_direction = Input.get_vector("left","right","up","down")
	#velocity = input_direction * speed

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.25
		# Handles dropdown movement
		if Input.is_action_pressed("down"):
			velocity += get_gravity() * delta * 2
	elif is_on_floor():
		jumps = 2
	
	#  Handles jumping
	if Input.is_action_just_pressed("up") and jumps > 0:
		#var input_direction = Input.get_vector("left","right","up","down")
		#velocity = input_direction * speed
		velocity.y = JUMP_VELOCITY
		jumps -= 1
		
	# Handles left-right movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	# Handles crouching and falling
	#if Input.is_action_just_pressed("down")
		

		
		
		
	
	#get_input()
	move_and_slide()
