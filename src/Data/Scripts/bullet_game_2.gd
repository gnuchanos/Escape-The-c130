extends CharacterBody2D

func _process(delta: float) -> void:
	velocity.y=-512
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Timer2.start()

func _on_timer_2_timeout() -> void:
	queue_free()
