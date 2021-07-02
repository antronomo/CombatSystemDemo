extends "res://GDscrips/EntityBase.gd"


#Función para mover al jugador, debería poder hacerse con cuatro líneas de código
func get_input(spd) -> Vector2:
	var velocity: Vector2 = Vector2.ZERO

	if Input.is_action_pressed('ui_right'):
		velocity.x += 10
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 10
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 10
	if Input.is_action_pressed('ui_down'):
		velocity.y += 10

	velocity = velocity.normalized() * spd

	return velocity

#Función para llamar cuando 'atacas'
func _unhandled_input(event) -> void:
	if event.is_action_pressed('ui_clic_iz'):
		hit_box.attack()

func _ready():
	pass


func _physics_process(delta) -> void:
	move_and_slide(get_input(spd) * delta)
