extends Node3D

var E1 = false
var E2 = false

var Door1Info = false
var Door2Info = false

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed('e'):
		if E1==true:
			if Door1Info==false:
				$"Doors and Cubes/Door_/MeshInstance3D5/AnimationPlayer".play("A")
			elif Door1Info==true:
				$"Doors and Cubes/Door_/MeshInstance3D5/AnimationPlayer".play_backwards("A")
		elif E2==true:
			if Door2Info==false:
				$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play("A")
			elif Door2Info==true:
				$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play_backwards("A")
		if $CanvasLayer/Control/Label2.visible==true:
			$CanvasLayer/Control/Control.visible=true
			$CanvasLayer/Control/Label2.visible=false
			GLobalVar.CharacterMovement=1
		elif $CanvasLayer/Control/Control.visible==true:
			$CanvasLayer/Control/Label2.visible=true
			$CanvasLayer/Control/Control.visible=false
			GLobalVar.CharacterMovement=0
			
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=true
		E1=true

func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=true
		E2=true
		

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=false
		E1=false

func _on_area_3d_2_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=false
		E2=false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Door1Info=not Door1Info

func _on_animation_player_animation_finished2(anim_name: StringName) -> void:
	Door2Info=not Door2Info


func _on_area_3d_3_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label2.visible=true
		
func _on_area_3d_3_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label2.visible=false
