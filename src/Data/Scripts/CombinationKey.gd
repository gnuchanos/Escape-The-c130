extends MeshInstance3D

func _process(delta: float) -> void:
	if GLobalVar.PlayerSettings['Combinations'][name]==true:
		position.z=0
	elif GLobalVar.PlayerSettings['Combinations'][name]==false:
		position.z=0.3
