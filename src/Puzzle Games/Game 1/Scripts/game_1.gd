extends Control

func _process(delta: float) -> void:
	$Control/ProgressBar.value=GLobalVar.Game1ProgressBar

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
