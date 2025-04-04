extends CanvasLayer

@export var GameDay = 0

func _ready() -> void:if GLobalVar.GameResult==0:
	randomize()
	CreateBomb(randi_range(1,2))

func _process(delta: float) -> void:
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
	$CanvasLayer/ColorRect2/Label.text=GLobalVar.Game2PanelText
	$CanvasLayer/ColorRect2.visible=GLobalVar.Game2Panel
	$CanvasLayer/Label.text=str(GLobalVar.Countdown)
	$CanvasLayer/ColorRect/CharacterBody2D.global_position.x=$Node2D.get_global_mouse_position().x

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

func _on_timer_timeout() -> void:if GLobalVar.GameResult==0:
	randomize()
	CreateBomb(randi_range(1,2))
	
func CreateBomb(Number):
		var Bomb = preload('res://Puzzle Games/Game 2/Scenes/bomb_ball.tscn').instantiate()
		randomize()
		Bomb.global_position=Vector2(randi_range(64,1024),randi_range(-64,-512))
		$Node2D.add_child(Bomb)
		Number-=1
		if Number>0:
			CreateBomb(Number)

func _on_play_again_pressed() -> void:
	GLobalVar.Countdown = 30
	GLobalVar.GameResult = 0
	GLobalVar.Game2Panel=false
	

func _on_timer_2_timeout() -> void:
	if GLobalVar.Countdown>0:
		GLobalVar.Countdown-=1
		if GLobalVar.Countdown<1:
			GLobalVar.GameResult=1
			GLobalVar.Game2Panel=true
			GLobalVar.Game2PanelText='Victory'
			GLobalVar.PlayerSettings['MiniGames']['2']=true
			GLobalVar.emit_signal('Game2GameResult')
			
			#
