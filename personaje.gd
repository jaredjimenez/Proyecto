extends KinematicBody2D

export (int) var Velocidad
var saltoV = -1000
var gravedad = 4000

var vectorVel = Vector2.ZERO

func moverIZQDER():
	vectorVel.x = 0
	
	if Input.is_action_pressed("ui_right"):
		vectorVel.x += Velocidad
		$Player.flip_h = false
	if Input.is_action_pressed("ui_left"):
		vectorVel.x -= Velocidad
		$Player.flip_h = true
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			vectorVel.y = saltoV
		
		
	if vectorVel.x != 0:
		$Player.animation = "correr"
		$Player.flip_h = vectorVel.x < 0
		$Player.flip_v = false
	elif vectorVel.y != 0:
		$Player.animation = "salto"
		
	else:
		$Player.animation = "quieto"
		
	
func _physics_process(delta: float) -> void:
	moverIZQDER()
	vectorVel.y += gravedad * delta
	
	vectorVel = move_and_slide(vectorVel, Vector2.UP)
