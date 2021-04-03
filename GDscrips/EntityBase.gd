extends KinematicBody2D

export var max_hp: int = 1000
export var hp: float = 1
export var atk: float = 100.0
export var deff: float = 100.0
export var spd: int = 50.0
export var vel: Vector2 = Vector2.ZERO

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
onready var animation = $AnimationPlayer


func dye():
	queue_free()

func _ready() -> void:
	hp = max_hp

func _process(_delta) -> void:
	if hp <= 0:
		dye()

	pass

func _physics_process(_delta) -> void:
	pass

