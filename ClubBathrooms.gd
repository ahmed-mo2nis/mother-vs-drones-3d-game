extends Area

func _on_ClubBathrooms_body_entered(body):
	if body is RigidBody:
		queue_free()
