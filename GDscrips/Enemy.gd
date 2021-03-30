extends Node2D

export var char_name: String = 'enemy'
export var heal_points: int = 1000
export var attack: float = 50
export var defense: float = 50
export var crit_chance: int = 15
export var crit_damage: int = 100

func die():
    queue_free()

func _ready():
	pass # Replace with function body.

func _process(delta):

	if heal_points <= 0:
		die()