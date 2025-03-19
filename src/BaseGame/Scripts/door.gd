extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('Object'):
		$Node3D/MeshInstance3D5/AnimationPlayer.play("A")

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group('Object'):
		$Node3D/MeshInstance3D5/AnimationPlayer.play_backwards("A")
