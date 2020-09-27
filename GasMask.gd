extends Area

func _on_GasMask_body_entered(body):
	if body.name == "Mother_test":
		queue_free()
