extends Area2D

func _process(delta: float) -> void:
	$"../CollisionShape2D".global_position.y+=8
	$"../Panel".global_position.y+=8
	$".".global_position.y+=8
	$"../Node2D".global_position.y+=8
