extends CharacterBody2D

var Devam = true
var K = true

func _ready() -> void:
	GLobalVar.Game2GameResult.connect(_Game2GameResult)

func _Game2GameResult():
	queue_free()

func _physics_process(delta: float) -> void:if Devam==true:
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:if K==true:
	if body.is_in_group('Game2_Character'):
		$Node2D.visible=true
		Devam=false
		velocity.y=0
		$Node2D/AnimationPlayer.play("A")
		$Timer.start()
		$Panel.visible=false
		K=false
	elif body.is_in_group('Game2_Floor'):
		GLobalVar.Game2Panel=true
		GLobalVar.GameResult=2
		GLobalVar.Countdown=0
		GLobalVar.Game2PanelText='Defeated'

func _on_timer_timeout() -> void:
	queue_free()
