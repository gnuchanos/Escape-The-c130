extends CanvasLayer

@export var GameDay = 4
signal PositionChange(_Number)

func _process(delta: float) -> void:
	if GLobalVar.PlayerSettings['Day']==GameDay:
		GLobalVar.shuwdownlabelvisible=not $Control/ColorRect2.visible
	name='Game'
	if GLobalVar.Test==false:
		if GLobalVar.GamesPanelVisible==false:
			if GLobalVar.PlayerSettings['Day']==GameDay:
				visible=true
			elif GLobalVar.PlayerSettings['Day']!=GameDay:
				visible=false
		elif GLobalVar.GamesPanelVisible==true:
				visible=false
	elif GLobalVar.Test==true:
		visible=true
	$Control/Control/Label.text=str(GLobalVar.Game4Countdown)
	if $Control/ColorRect2.visible==false:
		if $Control/Control/Node2D.get_global_mouse_position().x>=0 and $Control/Control/Node2D.get_global_mouse_position().x<=1152:
			if $Control/Control/Node2D.get_global_mouse_position().y>=0 and $Control/Control/Node2D.get_global_mouse_position().y<=648:
				$Control/Control/Spaceship.global_position=$Control/Control/Node2D.get_global_mouse_position()

func _on_play_again_pressed() -> void:
	GLobalVar.Game4Countdown=3
	$Control/ColorRect2.visible=false
	$Control/Node2D/Game4Wall.position.y=0
	$Control/Node2D/Game4Wall2.position.y=-384
	$Control/Node2D/Game4Wall3.position.y=-768
	
func _on_timer_timeout() -> void:
	if GLobalVar.Game4Countdown>0:
		GLobalVar.Game4Countdown-=1
		if GLobalVar.Game4Countdown<1:
			GLobalVar.emit_signal('Game4Finish',1)

func _ready() -> void:
	GLobalVar.Game4Finish.connect(_Game4Finish)

func _Game4Finish(Result:int):
	if Result==0:
		$Control/ColorRect2/Label.text='Defeated'
	elif Result==1:
		$Control/ColorRect2/Label.text='Victory'
		GLobalVar.PlayerSettings['MiniGames']['4']=true
		GLobalVar.shuwdownlabelvisible=true
		queue_free()
	$Control/ColorRect2.visible=true
