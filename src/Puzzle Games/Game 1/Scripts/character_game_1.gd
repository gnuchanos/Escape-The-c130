extends CharacterBody2D

var K = true
var Speed = 64

func _process(delta: float) -> void:
	$Node2D/RayCast2D/Button.visible=not $Node2D/RayCast2D.is_colliding()
	$Node2D/RayCast2D2/Button2.visible=not $Node2D/RayCast2D2.is_colliding()
	$Node2D/RayCast2D3/Button3.visible=not $Node2D/RayCast2D3.is_colliding()
	$Node2D/RayCast2D4/Button4.visible=not $Node2D/RayCast2D4.is_colliding()
	if K==false:
		$Node2D/RayCast2D/Button.disabled=true
		$Node2D/RayCast2D2/Button2.disabled=true
		$Node2D/RayCast2D3/Button3.disabled=true
		$Node2D/RayCast2D4/Button4.disabled=true
	elif K==true:
		$Node2D/RayCast2D/Button.disabled=false
		$Node2D/RayCast2D2/Button2.disabled=false
		$Node2D/RayCast2D3/Button3.disabled=false
		$Node2D/RayCast2D4/Button4.disabled=false

func _on_button_pressed() -> void:
	global_position.y+=Speed

func _on_button_2_pressed() -> void:
	global_position.y-=Speed

func _on_button_3_pressed() -> void:
	global_position.x-=Speed

func _on_button_4_pressed() -> void:
	global_position.x+=Speed

func _on_timer_timeout() -> void:
	K=true

var _Visible = true

func _input(event: InputEvent) -> void:if $"../..".visible==true:
	if _Visible==true:
		if not $Node2D/RayCast2D3.is_colliding():
			if event.is_action_pressed('ui_left'):
				global_position.x-=Speed
				_Visible=false
				$Timer2.start()
		if not $Node2D/RayCast2D4.is_colliding():
			if event.is_action_pressed('ui_right'):
				global_position.x+=Speed
				_Visible=false
				$Timer2.start()
		if not $Node2D/RayCast2D2.is_colliding():
			if event.is_action_pressed('ui_up'):
				global_position.y-=Speed
				_Visible=false
				$Timer2.start()
		if not $Node2D/RayCast2D.is_colliding():
			if event.is_action_pressed('ui_down'):
				global_position.y+=Speed
				_Visible=false
				$Timer2.start()
		
func _on_timer_2_timeout() -> void:
	_Visible=true
