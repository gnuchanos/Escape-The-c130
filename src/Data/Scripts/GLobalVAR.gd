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
	"talkMode":false,
	#General Settings
	"MiniGames":{
		'1':false,
		'2':false,
		'3':false,
		'4':false,
		'5':false
	},
	'Day':1,
	'KeyPlaced':false,
	'Game5Level':1,
	'GameDay2Victory':false,
	'Combinations':{
		'1':true,
		'2':true,
		'3':true,
		'4':true,
	},
	'GameOver':false,
}

signal KeyChanged

var shuwdownlabelvisible = true

var Asleep = false
var EPress = true
var KeyPress = false
var KeyMaked = false

var Test = false

##Games
var GamesPanelVisible = true
#Game 1
var Game1ProgressBar = 100
signal Game1Restart

#Game 2
var Countdown = 0
var GameResult = 3
signal Game2GameResult
var Game2Panel = true
var Game2PanelText = ''

#Game 3
var Game3Devam = true
var Game3Countdown = 0
signal Game3Finish(Result:int)

#Game 4
var Game4Devam = true
var Game4Countdown = 0
signal Game4Finish(Result:int)

#Game 5
var DevamGame5 = false
var SonucGame5 = 'Play'

#
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
	#_Load()
	pass
	
func _process(delta: float) -> void:
	_Save()
	pass
	
signal CubeCollising

#Character Movement
var CharacterMovement = 0
