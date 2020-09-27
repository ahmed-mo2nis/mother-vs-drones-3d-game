extends Area

func _on_Mosque_body_entered(body):
	if body is RigidBody:
		queue_free()
