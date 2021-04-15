extends "res://GDscrips/EntityBase.gd"

func get_input(vel, spd) -> Vector2:
	var velocity: Vector2 = vel

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

func _unhandled_input(event) -> void:
	if event.is_action_pressed('ui_clic_iz'):
		hit_box.attack()

func _ready():
	pass

func _physics_process(_delta):
	move_and_slide(get_input(vel, spd) * _delta)
