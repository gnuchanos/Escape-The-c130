extends CanvasLayer

@export var GameDay = 0

func _process(delta: float) -> void:
	if GLobalVar.GamesPanelVisible==false:
		if GLobalVar.PlayerSettings['Day']==GameDay:
			visible=true
		elif GLobalVar.PlayerSettings['Day']!=GameDay:
			visible=false
	elif GLobalVar.GamesPanelVisible==true:
		visible=false
	$CanvasLayer/Control/ProgressBar.value=GLobalVar.Game1ProgressBar
	if GLobalVar.Game1ProgressBar<1:
		$CanvasLayer/ColorRect.visible=true
		

func _on_area_2d_body_entered(body: Node2D) -> void:if body.is_in_group('Game1 Character'):
	$CanvasLayer/ColorRect2.visible=true
	GLobalVar.PlayerSettings['MiniGames']['1']=true

func _on_play_again_pressed() -> void:
	$CanvasLayer/CharacterGame1.global_position=Vector2(32,320)
	GLobalVar.Game1ProgressBar=100
	GLobalVar.emit_signal('Game1Restart')
	$CanvasLayer/ColorRect.visible=false
	$CanvasLayer/ColorRect2.visible=false
	
func _on_exit_pressed() -> void:
	$CanvasLayer/CharacterGame1.global_position=Vector2(32,320)
	GLobalVar.Game1ProgressBar=100
	GLobalVar.emit_signal('Game1Restart')
	$CanvasLayer/ColorRect.visible=false
	$CanvasLayer/ColorRect2.visible=false
	get_parent().get_node('.').visible=false
