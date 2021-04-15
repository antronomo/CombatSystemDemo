extends KinematicBody2D

export var char_name: String = 'default'
export var max_hp: int = 1000
export var hp: float = 1
export var atk: float = 100.0
export var deff: float = 100.0
export var crit_chance: float = 15.0
export var crit_dmg: int = 150
export var spd: int = 500
export var vel: Vector2 = Vector2.ZERO

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
onready var animation = $AnimationPlayer
onready var raycast2d = $RayCast2D
onready var hit_box = $HitBox
onready var hurt_box = $HurtBox


func dye():
	self.queue_free()

func handle_hit():
	print(name + ' has been hit!')


func damage_calculator(x_atk: float, y_deff: float, x_crit_cnace: float, x_crit_dmg: int) -> float:
	var _damage: float
	var _lucky: float = randi()%(26 + 75) * 100
	var _crit_strike: int = randi()%100 + 1
	var _is_crit: bool = false

	# Calculamos la suerte, para disminuir un poco el poder de araque y asi tener número variados
	x_atk *= _lucky / 100

	# Ver si has acertado un golpe critico
	if _crit_strike <= x_crit_cnace:
		_is_crit = true
		x_atk += (x_crit_dmg * x_atk) / 100
		print('You dealt a critical strike!!!')
	
	_damage = (x_atk * (x_atk * 100) / y_deff) /100

	return _damage


func _ready() -> void:
	self.hp = self.max_hp

	print(self.char_name +' is ready!')


func _process(_delta) -> void:
	if self.hp <= 0:
		dye()


func _physics_process(_delta) -> void:
	pass

