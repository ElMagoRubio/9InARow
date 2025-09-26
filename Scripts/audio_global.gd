extends Node

var audios: Dictionary = {}

func _ready():
	#Canciones
	_add_audio("audio_menu", "res://Assets/audio/audio_menu.wav")
	_add_audio("audio_partida", "res://Assets/audio/audio_partida.wav")
	
	_add_audio("normal_button", "res://Assets/audio/normal_button.wav")
	_add_audio("hover_button", "res://Assets/audio/hover_button.wav")
	_add_audio("start_button", "res://Assets/audio/start_button.wav")
	_add_audio("return_button", "res://Assets/audio/return_button.wav")
	
	_add_audio("player_move", "res://Assets/audio/player_move.wav")
	_add_audio("game_win", "res://Assets/audio/win_sound.wav")


func _add_audio(name: String, path: String) -> void:
	var player := AudioStreamPlayer.new()
	player.stream = load(path)
	add_child(player)
	audios[name] = player


func play_segment(name: String) -> void:
	if not audios.has(name):
		push_warning("Audio '%s' no encontrado." % name)
		return
	
	var player: AudioStreamPlayer = audios[name]
	if player.playing:
		player.stop()
	
	player.play()


func stop_play(name: String) -> void:
	if not audios.has(name):
		push_warning("Audio '%s' no encontrado." % name)
		return
		
	var player: AudioStreamPlayer = audios[name]
	if player.playing:
		player.stop()
