extends Area2D


func attack() -> void:
	print('working')
	pass

#Cambiar el metodo para que compare los grupos donde se encuentra los personajes y asignar grupo a estos
func on_HitBox_body_entered(_body: Node):
	if _body.has_node('HurtBox') and  _body != self:
		_body.handle_hit()
	pass
