extends Control

@onready var master_bus = AudioServer.get_bus_index("Master")
@onready var fullscreen_button = $VBoxContainer/Fullscreen

@onready var original_textures_check_button = $CustomLayout/Custom/Original/original
@onready var princesa_textures_check_button = $CustomLayout/Custom/Princesa/princesa
@onready var colorblind_textures_check_button = $CustomLayout/Custom/Daltonicos/daltonicos
@onready var label_title = $Label


func _ready():
	# Opcional: sincroniza el estado del botón con el modo actual
	fullscreen_button.button_pressed = (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_accesibilidad_pressed():
	AudioGlobal.play_segment("player_move")
	$VBoxContainer.visible = false
	$VolumenLabel.visible = false
	$CustomLayout.visible = true
	label_title.text = "PERSONALIZACIÓN"


func _on_volver_pressed():
	AudioGlobal.play_segment("player_move")
	await save_settings()
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")


func _on_x_1_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("x", "res://Assets/Tiles/original/x.png")
	VarGlobales.load_files("x_d", "res://Assets/Tiles/original/x_disabled.png")
	$AjustesTexturas/CasillasJugadores/X/TexturaX.texture_normal = VarGlobales.jugador_x
	save_settings()

func _on_x_2_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("x", "res://Assets/Tiles/princesa/x.png")
	VarGlobales.load_files("x_d", "res://Assets/Tiles/princesa/x_disabled.png")
	$AjustesTexturas/CasillasJugadores/X/TexturaX.texture_normal = VarGlobales.jugador_x
	save_settings()
	
func _on_x_3_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("x", "res://Assets/Tiles/daltonicos/x.png")
	VarGlobales.load_files("x_d", "res://Assets/Tiles/daltonicos/x_disabled.png")
	$AjustesTexturas/CasillasJugadores/X/TexturaX.texture_normal = VarGlobales.jugador_x
	save_settings()



func _on_o_1_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("o", "res://Assets/Tiles/original/o.png")
	VarGlobales.load_files("o_d", "res://Assets/Tiles/original/o_disabled.png")
	$AjustesTexturas/CasillasJugadores/O/TexturaO.texture_normal = VarGlobales.jugador_o
	save_settings()


func _on_o_2_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("o", "res://Assets/Tiles/princesa/o.png")
	VarGlobales.load_files("o_d", "res://Assets/Tiles/princesa/o_disabled.png")
	$AjustesTexturas/CasillasJugadores/O/TexturaO.texture_normal = VarGlobales.jugador_o
	save_settings()

func _on_o_3_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.load_files("o", "res://Assets/Tiles/daltonicos/o.png")
	VarGlobales.load_files("o_d", "res://Assets/Tiles/daltonicos/o_disabled.png")
	$AjustesTexturas/CasillasJugadores/O/TexturaO.texture_normal = VarGlobales.jugador_o
	save_settings()


func _on_volver_2_pressed():
	AudioGlobal.play_segment("player_move")
	$AjustesTexturas.visible = false
	$CustomLayout.visible = true
	save_settings()

func _on_original_toggled(button_pressed):
	if (button_pressed):
		AudioGlobal.play_segment("player_move")
		
		VarGlobales.load_files("x", "res://Assets/Tiles/original/x.png")
		VarGlobales.load_files("x_d", "res://Assets/Tiles/original/x_disabled.png")
		VarGlobales.load_files("o", "res://Assets/Tiles/original/o.png")
		VarGlobales.load_files("o_d", "res://Assets/Tiles/original/o_disabled.png")
		VarGlobales.load_files("l", "res://Assets/Tiles/original/libre.png")
		VarGlobales.load_files("l_d", "res://Assets/Tiles/original/libre_disabled.png")
		
		princesa_textures_check_button.button_pressed = false
		princesa_textures_check_button.disabled = false
		colorblind_textures_check_button.button_pressed = false
		colorblind_textures_check_button.disabled = false
		original_textures_check_button.disabled = true
		
		save_settings()


func _on_princesa_toggled(button_pressed):
	if (button_pressed):
		AudioGlobal.play_segment("player_move")
		
		VarGlobales.load_files("x", "res://Assets/Tiles/princesa/x.png")
		VarGlobales.load_files("x_d", "res://Assets/Tiles/princesa/x_disabled.png")
		VarGlobales.load_files("o", "res://Assets/Tiles/princesa/o.png")
		VarGlobales.load_files("o_d", "res://Assets/Tiles/princesa/o_disabled.png")
		VarGlobales.load_files("l", "res://Assets/Tiles/princesa/libre.png")
		VarGlobales.load_files("l_d", "res://Assets/Tiles/princesa/libre_disabled.png")
		
		original_textures_check_button.button_pressed = false
		original_textures_check_button.disabled = false
		colorblind_textures_check_button.button_pressed = false
		colorblind_textures_check_button.disabled = false
		princesa_textures_check_button.disabled = true
		
		save_settings()



func _on_daltonicos_toggled(button_pressed):
	if (button_pressed):
		AudioGlobal.play_segment("player_move")
		
		VarGlobales.load_files("x", "res://Assets/Tiles/daltonicos/x.png")
		VarGlobales.load_files("x_d", "res://Assets/Tiles/daltonicos/x_disabled.png")
		VarGlobales.load_files("o", "res://Assets/Tiles/daltonicos/o.png")
		VarGlobales.load_files("o_d", "res://Assets/Tiles/daltonicos/o_disabled.png")
		VarGlobales.load_files("l", "res://Assets/Tiles/daltonicos/libre.png")
		VarGlobales.load_files("l_d", "res://Assets/Tiles/daltonicos/libre_disabled.png")
		
		original_textures_check_button.button_pressed = false
		original_textures_check_button.disabled = false
		princesa_textures_check_button.button_pressed = false
		princesa_textures_check_button.disabled = false
		colorblind_textures_check_button.disabled = true
		
		save_settings()
	


func _on_ir_a_personalizado_pressed():
	AudioGlobal.play_segment("player_move")
	$CustomLayout.visible = false
	$AjustesTexturas.visible = true
	$AjustesTexturas/CasillasJugadores/O/TexturaO.texture_normal = VarGlobales.jugador_o
	$AjustesTexturas/CasillasJugadores/X/TexturaX.texture_normal = VarGlobales.jugador_x
	save_settings()


func _on_volver_3_pressed():
	AudioGlobal.play_segment("player_move")
	$CustomLayout.visible = false
	$VBoxContainer.visible = true
	$VolumenLabel.visible = true
	label_title.text = "AJUSTES"
	save_settings()


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		# Cambiar a pantalla completa
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		# Cambiar a modo ventana
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	save_settings()


func _on_volumen_drag_ended(value_changed: bool) -> void:
	AudioGlobal.play_segment("player_move")
	save_settings()


func save_settings():
	print("Guardando ajustes...")
	
	var save_ajustes = FileAccess.open(VarGlobales.file_guardar_ajustes, FileAccess.WRITE)
	var dict_ajustes =  {
		"pantalla_completa": DisplayServer.window_get_mode(),
		"audio_volumen": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
		"x": VarGlobales.file_x,
		"x_disabled": VarGlobales.file_x_d,
		"o": VarGlobales.file_o,
		"o_disabled": VarGlobales.file_o_d,
		"libre": VarGlobales.file_l,
		"libre_disabled": VarGlobales.file_l_d
	}
	save_ajustes.store_line(JSON.stringify(dict_ajustes))
	save_ajustes.close()
	
	print("Ajustes guardados")
