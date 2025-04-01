extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Game3Meteor'):
		GLobalVar.emit_signal('Game3Finish',0)

func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
