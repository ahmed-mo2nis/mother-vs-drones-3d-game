extends Area

func _on_FirstAidKit_body_entered(body):
	if body.name == "Mother_test":
		queue_free()
