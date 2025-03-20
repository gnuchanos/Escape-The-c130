extends Window

@onready var UInput = $ScrollContainer/VBoxContainer/input
@onready var COutput = $ScrollContainer/VBoxContainer/output
@onready var Dialog_Audio = $dialog

var line_count = 0

func _Console():
	if Input.is_action_just_pressed("Enter") and self.visible:
		if len(UInput.text) > 0:
			if "test" == UInput.text:
				COutput.text += " > " + str(UInput.text) + "\n"
				COutput.text += " > " + "Working LoL" + "\n"
				Dialog_Audio.stream = null
				Dialog_Audio.play()
			else:
				COutput.text += " > " + str(UInput.text) + "\n"
				COutput.text += " ????? \n"

			# dokunma buna
			var line_count = COutput.get_line_count()
			COutput.scroll_vertical = line_count
			UInput.text = ""

func _process(_delta: float) -> void:
	_Console()

func _on_close_requested() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.PlayerSettings["OpenConsole"] = false
	GLobalVar.PlayerSettings["talkMode"] = false
	GLobalVar.PlayerSettings["CanWalk"] = true
	self.hide()
