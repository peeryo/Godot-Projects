extends CharacterBody3D

const SPEED = 5.0
const ACCELERATION = 10.0
const ROTATION_SPEED = 5.0
const JUMP_VELOCITY = 5.0

@export var gravity = -10.0

func _physics_process(delta):
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var input_movement_vector = Vector3.ZERO
		
	input_movement_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_movement_vector.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
		
	velocity.y += gravity * delta
	velocity.x = input_movement_vector.x * SPEED
	velocity.z = input_movement_vector.z * SPEED 
	
	input_movement_vector = input_movement_vector.normalized()
	
	if input_movement_vector != Vector3.ZERO:
		var target_rotation = atan2(-input_movement_vector.x, -input_movement_vector.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, ROTATION_SPEED * delta)
	
	move_and_slide()


