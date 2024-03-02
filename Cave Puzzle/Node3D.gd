extends Node3D

var entered = 0

@export var wrech = 0
@export var wood = 0


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
	if wood == 1:
		if Input.is_action_just_pressed("lmclick") and entered == 1 and G.wood_picked == true:
			$SubViewport/ProgressBar.value +=10

