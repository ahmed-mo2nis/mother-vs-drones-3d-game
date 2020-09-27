extends Area

func _on_ClubBasketballCourt_body_entered(body):
	if body is RigidBody:
		queue_free()
