extends Node2D

export (PackedScene) var moneda
var monedas : int = 0

func _ready():
	randomize()
	$musica.play()
