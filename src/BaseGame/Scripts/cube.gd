extends RigidBody3D

func _process(delta: float) -> void:
	if $RayCast3D.is_colliding():
		pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	GLobalVar.emit_signal('CubeCollising')
