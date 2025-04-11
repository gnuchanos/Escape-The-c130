extends ScrollContainer

func _ready() -> void:
	if "english" == GLobalVar.PlayerSettings["lang"]:
		$VBoxContainer/MusicVolume/text.text    = " Music Volume"
		$VBoxContainer/EffectVolume/text.text   = " Effect Volume"
		$VBoxContainer/AmbianceVolume/text.text = " Ambiance Volume"
		$VBoxContainer/VoiceVolume/text.text    = " Voice Volume"
		$VBoxContainer/mouseSpeed/text.text     = " Mouse Speed"
		$VBoxContainer/camFOV/text.text         = " Camera FOV"
		$VBoxContainer/headShake/text.text      = " Head Shake"
		$VBoxContainer/fullScreen/text.text     = " Full Screen Mode"
	elif "turkish" == GLobalVar.PlayerSettings["lang"]:
		$VBoxContainer/MusicVolume/text.text    = " Müzik Sesi"
		$VBoxContainer/EffectVolume/text.text   = " Efekt Sesi"
		$VBoxContainer/AmbianceVolume/text.text = " Ambiyans Sesi"
		$VBoxContainer/VoiceVolume/text.text    = " Seslendirme Sesi"
		$VBoxContainer/mouseSpeed/text.text     = " Fare Hızı"
		$VBoxContainer/camFOV/text.text         = " Kamera FOV"
		$VBoxContainer/headShake/text.text      = " Baş Sallama"
		$VBoxContainer/fullScreen/text.text     = " Tam Ekran Modu"

func _Settings():
	if Input.is_action_just_pressed("escape") and not GLobalVar.PlayerSettings["talkMode"]:
		if not GLobalVar.PlayerSettings["OpenConsole"]:
			if not GLobalVar.PlayerSettings["OpenSettings"]:
				GLobalVar.PlayerSettings["CanWalk"] = false
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				GLobalVar.PlayerSettings["OpenSettings"] = true
				self.show()
			else:
				if not GLobalVar.PlayerSettings["OpenConsole"] and not GLobalVar.PlayerSettings["talkMode"]:
					GLobalVar.PlayerSettings["CanWalk"] = true
					Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
					GLobalVar.PlayerSettings["OpenSettings"] = false
					self.hide()

func _process(_delta: float) -> void:
	_Settings()

func _on_close_requested() -> void:
	GLobalVar.PlayerSettings["CanWalk"] = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GLobalVar.PlayerSettings["OpenSettings"] = false
	self.hide()

func _on_head_shake_check_box_toggled(toggled_on: bool) -> void:
	GLobalVar.PlayerSettings["HeadBob"] = toggled_on

func _on_mouse_speed_slider_value_changed(value: float) -> void:
	GLobalVar.PlayerSettings["MouseSpeed"] = value

func _on_voice_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"), linear_to_db(value))
func _on_effect_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effect"), linear_to_db(value))
func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
func _on_ambiance_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Ambiance"), linear_to_db(value))

func _on_cam_fov_slider_value_changed(value: float) -> void:
	GLobalVar.PlayerSettings["FOVMAX"] = value

func _on_english_pressed() -> void:
	GLobalVar.PlayerSettings["lang"] = "english"

func _on_turkish_pressed() -> void:
	GLobalVar.PlayerSettings["lang"] = "turkish"

func _on_full_screen_check_box_pressed() -> void:
	if GLobalVar.PlayerSettings["screenMode"]:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		GLobalVar.PlayerSettings["screenMode"] = false
		if "english" == GLobalVar.PlayerSettings["lang"]:
			$VBoxContainer/fullScreen/text.text     = " Full Screen Mode"
		elif "turkish" == GLobalVar.PlayerSettings["lang"]:
			$VBoxContainer/fullScreen/text.text     = " Tam Ekran Modu"
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		GLobalVar.PlayerSettings["screenMode"] = true
		if "english" == GLobalVar.PlayerSettings["lang"]:
			$VBoxContainer/fullScreen/text.text     = " Window Screen Mode"
		elif "turkish" == GLobalVar.PlayerSettings["lang"]:
			$VBoxContainer/fullScreen/text.text     = " Pencere Ekran Modu"
