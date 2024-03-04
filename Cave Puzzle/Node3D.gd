extends Node3D

var entered = 0

@export var wrech = 0
@export var wood = 0
@export var generator = 0






func _on_area_3d_body_entered(body):
	if body.has_method("player"):
		entered = 1

func _on_area_3d_body_exited(body):
	if body.has_method("player"):
		entered = 0


func _physics_process(delta):
	if wrech == 1:
		if Input.is_action_just_pressed("lmclick") and entered == 1 and G.wrench_picked == true:
			$SubViewport/ProgressBar.value +=10
			G.wrench_fix = true
			G.wood_fix = false
	if wood == 1:
		if Input.is_action_just_pressed("lmclick") and entered == 1 and G.wood_picked == true:
			$SubViewport/ProgressBar.value +=10
			G.wrench_fix = false
			G.wood_fix = true
	
	if generator == 1:
		if $AudioStreamPlayer3D.playing == false:
			$AudioStreamPlayer3D.playing = true


