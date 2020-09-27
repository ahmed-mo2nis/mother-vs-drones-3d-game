extends Area

func _on_Resturant_body_entered(body):
	if body is RigidBody:
		queue_free()
