extends Node2D

func _ready():
	AudioGlobal.play_segment("audio_menu")
	_load_settings()

func _on_start_pressed() -> void:
	AudioGlobal.play_segment("player_move")
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")


func _load_settings():
	var path = VarGlobales.file_guardar_ajustes # asegúrate de que esto sea "user://ajustes.json" o similar
	if not FileAccess.file_exists(path):
		print("No hay archivo de ajustes:", path)
		return

	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		printerr("No se puede abrir archivo de ajustes:", path)
		return
	
	var text := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var err := json.parse(text)
	if err != OK:
		printerr("Error parseando JSON de ajustes:", json.get_error_message(), "línea:", json.get_error_line())
		return
	
	var data = json.data
	
	# restaurar modo de pantalla (asegurarse de pasar int)
	if data.has("pantalla_completa"):
		DisplayServer.window_set_mode(int(data["pantalla_completa"]))
	
	# restaurar volumen (float)
	if data.has("audio_volumen"):
		var master := AudioServer.get_bus_index("Master")
		AudioServer.set_bus_volume_db(master, float(data["audio_volumen"]))
	
	# pasar rutas a VarGlobales -> la función load_ajustes se encargará de asignar y cargar
	VarGlobales.load_ajustes(
		data.get("x", ""), data.get("x_disabled", ""), 
		data.get("o", ""), data.get("o_disabled", ""), 
		data.get("libre", ""), data.get("libre_disabled", "")
	)
	print("Ajustes cargados desde", path)
