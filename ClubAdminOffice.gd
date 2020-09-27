extends Area

func _on_ClubAdminOffice_body_entered(body):
	if body is RigidBody:
		queue_free()
