extends CharacterBody3D


var SPEED = 5
var JUMP_VELOCITY = 4


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


var sens = 0.01

 
var seconds = 5
var minutes = 1





func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		$Node3D.rotate_y(-event.relative.x * sens)
		$Node3D/Camera3D.rotate_x(-event.relative.y * sens)
		$Node3D/Camera3D.rotation.x = clamp($Node3D/Camera3D.rotation.x, deg_to_rad(-45), deg_to_rad(45))



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = ($Node3D.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	move_and_slide()

func player():
	pass

func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	if seconds < 10:
		$SubViewport/Label.text = str(minutes) + ":0" + str(seconds)
	else:
		$SubViewport/Label.text = str(minutes) + ":" + str(seconds)
