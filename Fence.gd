extends Area

func _on_Fence_body_entered(body):
	if body is RigidBody:
		queue_free()
