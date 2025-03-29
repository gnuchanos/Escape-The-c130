extends CanvasLayer

func _process(delta: float) -> void:
	if $Control/Control/Node2D.get_global_mouse_position().x>=128 and $Control/Control/Node2D.get_global_mouse_position().x<=1024:
		if $Control/Control/Node2D.get_global_mouse_position().x>=128 and $Control/Control/Node2D.get_global_mouse_position().x<=1024:
			$Control/Control/Spaceship.global_position=$Control/Control/Node2D.get_global_mouse_position()
		
