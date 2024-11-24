extends CharacterBody2D
@export var speed = 400
const JUMP_VELOCITY = -600.0
var jumps: int = 2
var dash_ready: bool = true
var dashing_speed: int = 1
var last_direction: int = 1

#func get_input():
	#var input_direction = Input.get_vector("left","right","up","down")
	#velocity = input_direction * speed

func _physics_process(delta: float) -> void:
	if not $DashCooldown.time_left > ($DashCooldown.wait_time - 0.5):
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
			velocity.y = JUMP_VELOCITY
			jumps -= 1
			
		# Handles left-right movement
		var direction = Input.get_axis("left", "right")
		if direction:
			@warning_ignore("narrowing_conversion")
			last_direction = direction
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			
			
		# Handles crouching and falling
		#if Input.is_action_just_pressed("down")
	
	# Handles dashing
	if Input.is_action_just_pressed("dash") and dash_ready:
		dash_ready = false
		$DashCooldown.start()
	if $DashCooldown.time_left > ($DashCooldown.wait_time - 0.5):
		velocity.x = last_direction * speed * 3
		velocity.y = 0
		
	# animations
	if dashing_speed > 1:
		print("dashing")
	elif velocity.y > 0:
		print("falling")
	elif velocity.y < 0:
		print("rising")
	elif velocity.x < 0:
		print("moving left")
	elif velocity.x > 0:
		print("moving right")
	
	
	
		
		
	
	#get_input()
	move_and_slide()


func _on_dash_cooldown_timeout() -> void:
	dash_ready = true
	
