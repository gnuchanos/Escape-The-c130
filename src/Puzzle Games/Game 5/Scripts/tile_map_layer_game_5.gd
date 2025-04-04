extends TileMapLayer

func _process(delta: float) -> void:
	if name==('TileMapLayer'+str(GLobalVar.PlayerSettings['Game5Level'])):
		enabled=true
		visible=true
		get_parent().get_node('.').visible=true
	elif name!=('TileMapLayer'+str(GLobalVar.PlayerSettings['Game5Level'])):
		enabled=false
		visible=false
		get_parent().get_node('.').visible=false
		
