extends Node3D



func _process(delta: float) -> void:
	if not $test_audio.playing:
		$test_audio.play()
	if not $test_audio2.playing:
		$test_audio2.play()
