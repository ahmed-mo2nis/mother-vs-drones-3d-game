extends Area

func _on_Bottle_body_entered(body):
	if body.name == "Mother_test":
		queue_free()
