extends CharacterBody2D

func _ready() -> void:
	GLobalVar.Game3Finish.connect(_Game3Finish)

func _Game3Finish(Result:int):
	queue_free()

func _process(delta: float) -> void:
	global_position.y+=4
	
func _on_timer_timeout() -> void:
	queue_free()
