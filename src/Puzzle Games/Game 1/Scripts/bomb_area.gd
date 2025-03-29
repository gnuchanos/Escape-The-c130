extends Area2D

var Random = 0
var Enabled = true

func _ready() -> void:
	randomize()
	Random=randi_range(-50,25)
	GLobalVar.Game1Restart.connect(_Game1Restart)
	
func _Game1Restart():
	randomize()
	Random=randi_range(-50,25)
	Enabled=true
	
func _on_timer_timeout() -> void:
	Enabled=false
	visible=false

func _on_body_entered(body: Node2D) -> void:if Enabled==true:
	if body.is_in_group('Game1 Character'):
		if Random>0:
			GLobalVar.Game1ProgressBar-=10
			visible=true
			$Timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Game1Character'):
		pass

func _process(delta: float) -> void:
	pass
	
