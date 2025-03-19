extends Node

var PlayerSettings = {
	"Name":"Dumb",
	"lang":"turkish",
	"Speed":3,
	"CurrentSpeed":3,
	"MaxSpeed":5,
	"Stamina":3,
	"MouseSpeed":0.2,
	"JumpHeight":5,
	"HeadBob":true,
	"CanWalk":true,
	"CanRun":true,
	"CanJump":true,
	"Duck":false,
	"Crawling":false,
	"UsingPC":false,
	"HandReady":false,
	"HandCurrentIndex":0,
	"BeforeHandIndex":0,
	"HoldingQuestItem":false,
	"FOV":90,
	"FOVMAX":90,
	"FOVMIN":50,
	"GiveLife":false,
	"OpenConsole":false,
	"OpenSettings":false,
	"screenMode":false,
	"talkMode":false
}

func _Load():
	if FileAccess.file_exists('user://Global.save'):
		var File = FileAccess.open('user://Global.save',FileAccess.READ)
		PlayerSettings=JSON.parse_string(File.get_line())
		File.close()

func _Save():
	var File = FileAccess.open('user://Global.save',FileAccess.WRITE)
	File.store_line(JSON.stringify(PlayerSettings))
	File.close()

func _ready() -> void:
	_Load()
	pass
	
func _process(delta: float) -> void:
	_Save()
	pass
	
