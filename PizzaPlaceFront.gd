extends Area

func _on_PizzaPlace_body_entered(body):
	if body is RigidBody:
		queue_free()
