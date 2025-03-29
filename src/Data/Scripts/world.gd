extends Node3D

var E1 = false
var E2 = false

var Door1Info = false
var Door2Info = false

func _ready() -> void:
	if GLobalVar.PlayerSettings['KeyPlaced']==true:
		$"Doors and Cubes/Door_3/MeshInstance3D5/AnimationPlayer".play("A")

func _process(delta: float) -> void:
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
	
	GLobalVar.GamesPanelVisible=not $CanvasLayer/Control/Control.visible

func _input(event: InputEvent) -> void:
	if GLobalVar.Asleep==true:
		if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
			$Timer.start()
			GLobalVar.EPress=false
			GLobalVar.Asleep=false
	elif GLobalVar.Asleep==false:
		if GLobalVar.PlayerSettings['MiniGames'][str(GLobalVar.PlayerSettings['Day'])]==true:
			if $CanvasLayer/Control/Label3.visible==true:
				if Input.is_action_pressed('e'):if GLobalVar.EPress==true:
					GLobalVar.PlayerSettings['Day']+=1
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
