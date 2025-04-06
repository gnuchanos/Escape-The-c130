extends CharacterBody2D

func _process(delta: float) -> void:
	velocity.y=-512
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()
	
	
