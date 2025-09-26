extends Control

@onready var guardado = VarGlobales.guardado

func _process(delta):
	$VBoxContainer/Reanudar.visible = FileAccess.file_exists("res://guardar.save")


func _on_jugar_pressed():
	AudioGlobal.play_segment("player_move")
	VarGlobales.nueva()
	get_tree().change_scene_to_file("res://Escenas/juego.tscn")


func _on_salir_pressed():
	AudioGlobal.play_segment("player_move")
	get_tree().quit()


func _on_opciones_pressed():
	AudioGlobal.play_segment("player_move")
	get_tree().change_scene_to_file("res://Escenas/menu_opciones.tscn")


func _on_reanudar_pressed():
	AudioGlobal.play_segment("player_move")
	_load()
	VarGlobales.cargar_guardado = true
	get_tree().change_scene_to_file("res://Escenas/juego.tscn")


func _load():
	if FileAccess.file_exists(VarGlobales.file_guardar):
		var file = FileAccess.open(VarGlobales.file_guardar, FileAccess.READ)
		while file.get_position() < file.get_length():
			var json_string = file.get_line()
			var json = JSON.new()
			var _parse_result = json.parse(json_string)
			var node_data = json.get_data()
			if node_data["tablero"] == "var_globales":
				VarGlobales.load_variables(node_data["turno_jugador"], node_data["ganador_global"])
			else:
				var tablero = []
				tablero.append(node_data["casilla0"])
				tablero.append(node_data["casilla1"])
				tablero.append(node_data["casilla2"])
				tablero.append(node_data["casilla3"])
				tablero.append(node_data["casilla4"])
				tablero.append(node_data["casilla5"])
				tablero.append(node_data["casilla6"])
				tablero.append(node_data["casilla7"])
				tablero.append(node_data["casilla8"])
				VarGlobales.load_tablero(node_data["tablero"], tablero, node_data["var1"], node_data["var2"], node_data["var3"])
		file.close()
				
		var dir = DirAccess.open("res://")
		dir.remove(VarGlobales.file_guardar)
	
