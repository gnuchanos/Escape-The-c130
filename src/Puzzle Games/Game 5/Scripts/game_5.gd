extends CanvasLayer

@export var GameDay = 5

func _process(delta: float) -> void:
	if GLobalVar.PlayerSettings['Day']==GameDay:
		GLobalVar.shuwdownlabelvisible=not $ColorRect2.visible
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
	
	$ColorRect2/Label.text=GLobalVar.SonucGame5
	$ColorRect2.visible=not GLobalVar.DevamGame5

func _on_play_again_pressed() -> void:
	var Scene = load("res://Puzzle Games/Game 5/Levels/level_"+str(GLobalVar.PlayerSettings['Game5Level'])+".tscn").instantiate()
	$"Level 1/ColorRect/Node2D".add_child(Scene)
	$"Level 1/ColorRect/Character/CharacterGame5".global_position=get_node('Node2D/'+str(GLobalVar.PlayerSettings['Game5Level'])).global_position
	$"Level 1/ColorRect/Flag/Area2D".global_position=get_node('Node2D2/'+str(GLobalVar.PlayerSettings['Game5Level'])).global_position
	GLobalVar.DevamGame5=true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('C5'):
		GLobalVar.SonucGame5='Victory'
		GLobalVar.DevamGame5=false
		GLobalVar.PlayerSettings['Game5Level']+=1
		GLobalVar.shuwdownlabelvisible=true
		queue_free()
