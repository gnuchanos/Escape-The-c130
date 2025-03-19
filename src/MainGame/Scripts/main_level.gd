extends Node3D


func _ready() -> void:
	GLobalVar.PlayerSettings["CanJump"] = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
