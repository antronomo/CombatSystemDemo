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
	var lucky:int = randi()%100+1
	var critical:int = randi()%100+1
	
	if critical <= crit_chance:
		add_crit = true
	else:
		add_crit = false
	
	if defense <= 0:
		defense = 1
	
	while lucky < 75:
		lucky = randi()%100+1
	
	"""
	First attack may get reducced by a lucky percentage
	attack = (attack * lucky) /100
	
	Then, calcualte a percentage of player's attack by objective defense
	percentage = (attack * 100) / defense
	
	finally, i calculate damage by changing attack by percentage
	damage = (attack * percentage) / 100
	"""
	
	attack = (attack * lucky) / 100 
	damage = ((attack * ((attack * 100) / defense))) / 100
	
	
	if add_crit == true:
		damage += ((damage * crit_dmg) / 100)
	
	if damage <= 1: 
		damage = 1
	
	return damage



func _on_b_attack_pressed():
	#print('Pressed')
	print('*********************************************************************')
	print('The objective lost ' + str(damage_calculation(attack_player, defense_objective, critical_chance, critical_damage)) + ' HP')
	if add_crit == true:
		print('¡YOU DEALT A CRITICAL HIT!')
