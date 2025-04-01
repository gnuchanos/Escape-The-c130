extends TileMapLayer

func _process(delta: float) -> void:if $"../../ColorRect2".visible==false:
	position.y+=2
	if position.y>=720:
		randomize()
		position=Vector2(randi_range(-408,408),-384)
