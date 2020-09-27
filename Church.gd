extends Area

func _on_Church_body_entered(body):
	if body is RigidBody:
		queue_free()
