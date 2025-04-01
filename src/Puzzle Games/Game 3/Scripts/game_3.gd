extends CanvasLayer

@export var GameDay = 3

func _process(delta: float) -> void:
	if GLobalVar.GamesPanelVisible==false:
		if GLobalVar.PlayerSettings['Day']==GameDay:
			visible=true
		elif GLobalVar.PlayerSettings['Day']!=GameDay:
			visible=false
	elif GLobalVar.GamesPanelVisible==true:
		visible=false
	$Control/Control/Label.text=str(GLobalVar.Game3Countdown)
	if $Control/Control/Node2D.get_global_mouse_position().x>=128 and $Control/Control/Node2D.get_global_mouse_position().x<=1024:
		if $Control/Control/Node2D.get_global_mouse_position().y>=128 and $Control/Control/Node2D.get_global_mouse_position().y<=512:
			$Control/Control/Spaceship.global_position=$Control/Control/Node2D.get_global_mouse_position()

func _on_timer_timeout() -> void:
	if $Control/ColorRect2.visible==false:
		MeteorAdd(randi_range(1,4))
	if GLobalVar.Game3Countdown>0:
		GLobalVar.Game3Countdown-=1
		if GLobalVar.Game3Countdown<1:
			GLobalVar.emit_signal('Game3Finish',1)

func MeteorAdd(Number):
	var Meteor = preload('res://Puzzle Games/Game 3/Scenes/meteor.tscn').instantiate()
	randomize()
	Meteor.global_position.x=randi_range(0,1152)
	Meteor.global_position.y=-72
	add_child(Meteor)
	Number-=1
	if Number>0:
		MeteorAdd(Number)

func _on_play_again_pressed() -> void:
	GLobalVar.Game3Countdown=30
	$Timer.start()
	$Control/ColorRect2.visible=false

func _ready() -> void:
	GLobalVar.Game3Finish.connect(_Game3Finish)

func _Game3Finish(Result:int):
	if Result==0:
		$Control/ColorRect2/Label.text='Defeated'
	elif Result==1:
		$Control/ColorRect2/Label.text='Victory'
		GLobalVar.PlayerSettings['MiniGames']['3']=true
		GLobalVar.KeyMaked=true
	$Control/ColorRect2.visible=true
