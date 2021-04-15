extends Area2D


func attack() -> void:
	print('working')
	pass

func _on_HitBox_body_entered(_body: Node):
	if _body.has_node('HurtBox') and  _body != self:
		_body.handle_hit()
	pass
