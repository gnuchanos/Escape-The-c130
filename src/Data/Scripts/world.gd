extends Node3D

var E1 = false
var E2 = false

var Door1Info = false
var Door2Info = false

func _ready() -> void:
	if GLobalVar.PlayerSettings['GameOver']==true:
		GLobalVar.PlayerSettings['GameOver']=false
		get_tree().reload_current_scene()
	if GLobalVar.PlayerSettings['Combinations']['1']==false and GLobalVar.PlayerSettings['Combinations']['4']==false and GLobalVar.PlayerSettings['Combinations']['2']==true and GLobalVar.PlayerSettings['Combinations']['3']==true:
		$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play("A")
		$"Doors and Cubes/Door_3/MeshInstance3D5/AnimationPlayer".play("A")
	GLobalVar.KeyChanged.connect(_KeyChanged)
	if GLobalVar.PlayerSettings['GameDay2Victory']==true:
		$"Doors and Cubes/Door3/Node3D/MeshInstance3D5/AnimationPlayer".play("A")
		var Cube = preload('res://Data/Scenes/cubes.tscn').instantiate()
		Cube.global_position=Vector3(-0.45,0.375,0.554)
		$"Doors and Cubes".add_child(Cube)
		Cube.global_position=Vector3(-0.45,0.375,0.554)
	if GLobalVar.PlayerSettings['Day']==5:
		$"Doors and Cubes/Parmaklik".global_position.y=100
	var Scene = load('res://Puzzle Games/Game '+str(GLobalVar.PlayerSettings['Day'])+'/Scenes/'+'game_'+str(GLobalVar.PlayerSettings['Day'])+'.tscn').instantiate()
	Scene.name='Game'
	$CanvasLayer/Control/Control/ColorRect/Control.add_child(Scene)
	Scene.name='Game'
	GLobalVar.Game2GameResult.connect(_Game2GameResult)
	if GLobalVar.PlayerSettings['KeyPlaced']==true:
		$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play("A")
		$"Doors and Cubes/Door_3/MeshInstance3D5/AnimationPlayer".play("A")

func _KeyChanged():
	if GLobalVar.PlayerSettings['Combinations']['1']==false and GLobalVar.PlayerSettings['Combinations']['4']==false and GLobalVar.PlayerSettings['Combinations']['2']==true and GLobalVar.PlayerSettings['Combinations']['3']==true:
		$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play("A")
		$"Doors and Cubes/Door_3/MeshInstance3D5/AnimationPlayer".play("A")

func _Game2GameResult():
	$"Doors and Cubes/Door3/Node3D/MeshInstance3D5/AnimationPlayer".play("A")
	var Cube = preload('res://Data/Scenes/cubes.tscn').instantiate()
	Cube.global_position=Vector3(-0.45,0.375,0.554)
	$"Doors and Cubes".add_child(Cube)
	Cube.global_position=Vector3(-0.45,0.375,0.554)

func _process(delta: float) -> void:
	if GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==true:
		$CanvasLayer/Control/Label2.visible=false
		GLobalVar.shuwdownlabelvisible=true
		GLobalVar.CharacterMovement=0
		
		
	$CanvasLayer/Control/Control/ColorRect/Label.visible=not GLobalVar.shuwdownlabelvisible
	$CanvasLayer/ColorRect.visible=GLobalVar.Asleep
	$Label.visible=not GLobalVar.Asleep
	$Label.text='Day '+str(GLobalVar.PlayerSettings['Day'])
	if $CanvasLayer/Control/Label4.visible==true:
		if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
			$Node3D2/Area3D5.queue_free()
			GLobalVar.KeyPress=true
			$Timer.start()
			GLobalVar.EPress=false
		
	if $CanvasLayer/Control/Label5.visible==true:
		if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
			GLobalVar.KeyPress=false
			GLobalVar.PlayerSettings['KeyPlaced']=true
			$"Doors and Cubes/Door_3/MeshInstance3D5/AnimationPlayer".play("A")
			$Timer.start()
			GLobalVar.EPress=false
			
	$Node3D2/main_004.visible=GLobalVar.PlayerSettings['KeyPlaced']
	$Node3D/Bad/Camera3D.current=GLobalVar.Asleep
	if GLobalVar.Asleep==true:
		$CanvasLayer/Control/Label3.text='Press “E” to wake up'
	elif GLobalVar.Asleep==false:
		if GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==true:
			$CanvasLayer/Control/Label3.text='Press “E” to go to sleep'
		elif GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==false:
			$CanvasLayer/Control/Label3.text="Finish this day's play to sleep"
	
	if GLobalVar.GamesPanelVisible==false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	elif GLobalVar.GamesPanelVisible==true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==false:
		GLobalVar.GamesPanelVisible=not $CanvasLayer/Control/Control.visible
		$CanvasLayer/Control/Label2.text='Press the “E” key to turn on the computer'
	elif GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==true:
		GLobalVar.GamesPanelVisible=true
		$CanvasLayer/Control/Label2.text=''

func _input(event: InputEvent) -> void:
	if GLobalVar.Asleep==true:
		if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
			$Timer.start()
			if GLobalVar.PlayerSettings['Day']==5:
				$"Doors and Cubes/Parmaklik".global_position.y=100
			elif GLobalVar.PlayerSettings['Day']==6:
				GLobalVar.PlayerSettings['GameOver']=true
				$CanvasLayer2.visible=true
			GLobalVar.EPress=false
			GLobalVar.Asleep=false
	elif GLobalVar.Asleep==false:
		if GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==true:
			if $CanvasLayer/Control/Label3.visible==true:
				if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
					get_node('CanvasLayer/Control/Control/ColorRect/Control/Game').queue_free()
					GLobalVar.PlayerSettings['Day']+=1
					if GLobalVar.PlayerSettings['Day']==5:
						$"Doors and Cubes/Parmaklik".global_position.y=100
					var Scene = load('res://Puzzle Games/Game '+str(GLobalVar.PlayerSettings['Day'])+'/Scenes/'+'game_'+str(GLobalVar.PlayerSettings['Day'])+'.tscn').instantiate()
					Scene.name='Game'
					$CanvasLayer/Control/Control/ColorRect/Control.add_child(Scene)
					Scene.name='Game'
					GLobalVar.Asleep=true
					$Timer.start()
					GLobalVar.EPress=false
	
	
	
	if GLobalVar.EPress==true:
		if Input.is_action_pressed('e'):
			if E1==true:
				if Door1Info==false:
					$"Doors and Cubes/Door_/MeshInstance3D5/AnimationPlayer".play("A")
				elif Door1Info==true:
					$"Doors and Cubes/Door_/MeshInstance3D5/AnimationPlayer".play_backwards("A")
			elif E2==true:
				if Door2Info==false:
					$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play("A")
				elif Door2Info==true:
					$"Doors and Cubes/Door_2/MeshInstance3D5/AnimationPlayer".play_backwards("A")
			if $CanvasLayer/Control/Label2.visible==true:
				$CanvasLayer/Control/Control.visible=true
				$CanvasLayer/Control/Label2.visible=false
				GLobalVar.CharacterMovement=1
			elif $CanvasLayer/Control/Control.visible==true:
				$CanvasLayer/Control/Label2.visible=true
				$CanvasLayer/Control/Control.visible=false
				GLobalVar.CharacterMovement=0
			$Timer.start()
			GLobalVar.EPress=false
			
			
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=true
		E1=true

func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=true
		E2=true
		

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=false
		E1=false

func _on_area_3d_2_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label.visible=false
		E2=false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Door1Info=not Door1Info

func _on_animation_player_animation_finished2(anim_name: StringName) -> void:
	Door2Info=not Door2Info


func _on_area_3d_3_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label2.visible=true
		
func _on_area_3d_3_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label2.visible=false


func _on_area_3d_4_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label3.visible=true

func _on_area_3d_4_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label3.visible=false


func _on_timer_timeout() -> void:
	GLobalVar.EPress=true


func _on_area_3d_5_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):if GLobalVar.KeyMaked==true:
		$CanvasLayer/Control/Label4.visible=true

func _on_area_3d_5_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):if GLobalVar.KeyMaked==true:
		$CanvasLayer/Control/Label4.visible=false


func _on_area_3d_6_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label5.visible=true

func _on_area_3d_6_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		$CanvasLayer/Control/Label5.visible=false


func _on_area_3d_7_body_entered(body: Node3D) -> void:
	if body.is_in_group('Character'):
		DoorGameOver()

func _on_area_3d_7_body_exited(body: Node3D) -> void:
	if body.is_in_group('Character'):
		pass

func DoorGameOver():
	$CanvasLayer/Control2.visible=true
	GLobalVar.PlayerSettings['GameOver']=true
	$CanvasLayer/Control2/ColorRect.visible=true
	$CanvasLayer/Control2/AudioStreamPlayer2.play()
	$CanvasLayer/Control2/ColorRect/AnimationPlayer.play("A")
	$Timer2.start()
	
func _on_timer_2_timeout() -> void:
	$CanvasLayer/Control2/ColorRect2.visible=true
	$CanvasLayer/Control2/ColorRect2/TextureRect/AnimationPlayer.play("new_animation")
	$CanvasLayer/Control2/AudioStreamPlayer.play()
	$Timer3.start()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file('res://Data/Scenes/main_menu.tscn')

func _on_oyunfor_donate_pressed() -> void:
	OS.shell_open('https://www.oyunfor.com/donate/gnuchanos')


func _on_timer_3_timeout() -> void:
	GLobalVar.PlayerSettings['GameOver']=true
	$CanvasLayer2.visible=true
