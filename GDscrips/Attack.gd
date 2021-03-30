extends Node

#player
export var attack_player:float = 100.0
export var critical_chance:int = 50
export var critical_damage:int = 150

#objective
export var defense_objective:float = 100.0

#combat things
var add_crit:bool = false


func damage_calculation(attack, defense, crit_chance, crit_dmg):
	var damage:float
	var lucky:int = randi()%26+75
	var critical:int = randi()%100+1
	

	if critical <= crit_chance:
		add_crit = true
	else:
		add_crit = false
	

	if defense <= 0:
		defense = 1

		
	attack = (attack * lucky) / 100 
	damage = ((attack * ((attack * 100) / defense))) / 100
	
	
	if add_crit == true:
		damage += ((damage * crit_dmg) / 100)
		print('¡YOU DEALT A CRITICAL HIT!')
	
	if damage <= 1: 
		damage = 1
	
		
	return damage



func _on_b_attack_pressed():
	#print('Pressed')
	print('*********************************************************************')
	print('The objective lost ' + str(damage_calculation(attack_player, defense_objective, critical_chance, critical_damage)) + ' HP')
