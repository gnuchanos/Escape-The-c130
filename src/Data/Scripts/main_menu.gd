extends CanvasLayer

var PanelOpenNumber = 0

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://Data/Scenes/world.tscn')

func _on_settings_pressed() -> void:
	PanelOpenNumber=1
	PanelMove()

func _on_about_us_pressed() -> void:
	PanelOpenNumber=2
	PanelMove()

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	PanelOpenNumber=0
	PanelMove()

func _on_timer_timeout() -> void:
	PanelsOpens()

func PanelMove():
	$Control/AnimationPlayer.play('A')
	$Timer.start()

func PanelsOpens():
	if PanelOpenNumber==0:
		$Control/Control.visible=true
		$Control/Control2.visible=false
		$Control/Control3.visible=false
		$Control/Control4.visible=false
	elif PanelOpenNumber==1:
		$Control/Control.visible=false
		$Control/Control2.visible=true
		$Control/Control3.visible=false
		$Control/Control4.visible=false
	elif PanelOpenNumber==2:
		$Control/Control.visible=false
		$Control/Control2.visible=false
		$Control/Control3.visible=true
		$Control/Control4.visible=false
	elif PanelOpenNumber==3:
		$Control/Control.visible=false
		$Control/Control2.visible=false
		$Control/Control3.visible=false
		$Control/Control4.visible=true

func _on_donation_pressed() -> void:
	OS.shell_open('https://www.oyunfor.com/donate/gnuchanos')
