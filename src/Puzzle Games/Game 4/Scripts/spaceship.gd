extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Game4Wall'):
		GLobalVar.emit_signal('Game4Finish',0)

func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
