extends Node3D

func _ready() -> void:
	$Node3D/MeshInstance3D5/Node3D/door.set_surface_override_material(0,load("res://Data/Materials/Door Materials/0.tres"))
	$Node3D/MeshInstance3D5/Node3D/door.set_surface_override_material(1,load("res://Data/Materials/Door Materials/1.tres"))
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('Object'):
		$Node3D/MeshInstance3D5/AnimationPlayer.play("A")

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group('Object'):
		$Node3D/MeshInstance3D5/AnimationPlayer.play_backwards("A")
