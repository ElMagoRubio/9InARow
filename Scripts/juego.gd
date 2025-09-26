extends Control

@onready var Tableros = $Tableros
@onready var MenuGeneral = $menu_pausa/general
@onready var MenuAjustes = $menu_opciones

@onready var pausado = false

#Control de los botones
func _on_pausa_pressed():
	update_pause()
	AudioGlobal.play_segment("return_button")
	print("Pulsado botón pausa")
	
	print("Pausado: ", pausado, "  |  Ultima jugada: ", VarGlobales.ultima_jugada)
	if (pausado == true and VarGlobales.ultima_jugada != -1):
		print("Partida empezada, guardando...")
		await save()  
		VarGlobales.guardado = true

func _on_reanudar_pressed():
	AudioGlobal.play_segment("return_button")
	print("Reanudar")
	update_pause()

func _on_nueva_pressed():
	AudioGlobal.play_segment("player_move")
	get_tree().paused = false
	VarGlobales.nueva()
	get_tree().change_scene_to_file("res://Escenas/juego.tscn")

func _on_ajustes_pressed() -> void:
	AudioGlobal.play_segment("player_move")
	Tableros.visible = false
	MenuGeneral.visible = false
	MenuAjustes.visible = true
	

func _on_salir_pressed():
	AudioGlobal.play_segment("player_move")
	get_tree().paused = false
	var timer := get_tree().create_timer(0.1)
	timer.timeout.connect(func():get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn"))


func save():
	print("Guardando partida...")
	var save_game = FileAccess.open(VarGlobales.file_guardar, FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("tablero_juego")
	for node in save_nodes:
		var node_data = node.save()
		save_game.store_line(JSON.stringify(node_data))
	save_nodes = get_tree().get_first_node_in_group("tablero_final")
	var node_data = save_nodes.save()
	save_game.store_line(JSON.stringify(node_data))
	
	var dict = {
		"tablero": "var_globales",
		"turno_jugador": VarGlobales.turno_jugador,
		"ganador_global": VarGlobales.ganador_global
	}
	save_game.store_line(JSON.stringify(dict))
	save_game.close()
	
	print("Partida guardada")


func update_pause():
	pausado = !pausado
	get_tree().paused = pausado
	print("Estado de pausa: ", pausado)
	
	Tableros.visible = !pausado
	MenuGeneral.visible = pausado
	MenuAjustes.visible = false
	print("Tableros visibles: ", !pausado, "  |  Menu visible: ", pausado)
