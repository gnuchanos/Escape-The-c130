extends Area2D

var Random = 0

func _ready() -> void:
	randomize()
	Random=randi_range(-50,25)

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Game1 Character'):
		if Random>0:
			GLobalVar.Game1ProgressBar-=10
			visible=true
			$Timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Game1Character'):
		pass
