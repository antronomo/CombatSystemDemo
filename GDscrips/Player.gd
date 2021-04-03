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

func _ready():
	print('ready')

func _physics_process(delta):
	move_and_slide(get_input(vel, spd) * delta)
