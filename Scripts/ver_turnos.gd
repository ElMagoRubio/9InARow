extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	_cambia_turno()

func _cambia_turno():
	if VarGlobales.turno_jugador == "o":
		$VBoxContainer/Casilla0.texture_normal = VarGlobales.jugador_o
	elif VarGlobales.turno_jugador == "x":
		$VBoxContainer/Casilla0.texture_normal = VarGlobales.jugador_x
