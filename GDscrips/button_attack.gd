extends Button


func damage_calculation(_atk, _deff, _crit_chance, _crit_damage):
	var _damage:float
	var _lucky:int = randi()%26+75
	var _critical:int = randi()%100+1
	var _add_crit: bool = false
	

	if _critical <= _crit_chance:
		_add_crit = true
	else:
		_add_crit = false
	

	if _deff <= 0:
		_deff = 1

		
	_atk = ( _atk * _lucky) / 100 
	_damage = (( _atk * (( _atk * 100) / _deff))) / 100
	
	
	if _add_crit == true:
		_damage += ((_damage * _crit_damage) / 100)
		print('¡YOU DEALT A CRITICAL HIT!')
	
	if _damage <= 1: 
		_damage = 1
	
		
	return _damage


# No se como hace que coja las variables de nodos en la misma escena
func _on_b_attack_pressed():
	print('*******************************************************************')
	print('Enemy lost ' + str(damage_calculation(player.attack, enemy.defense, player.crit_chance, player.crit_damage)) + ' HP')

