extends Area

func _on_ClubFence_body_entered(body):
	if body is RigidBody:
		queue_free()
