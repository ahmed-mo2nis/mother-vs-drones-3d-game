extends Area

func _on_SportsCar_body_entered(body):
	if body is RigidBody:
		queue_free()
