extends Path2D

func add_enpoints(from : Vector2, to : Vector2):
	curve.clear_points()
	curve.add_point(from)
	curve.add_point(to)
	
func _input(event):
	if event.is_action_pressed("info"):
		print(name, ' Unit Offset ', $PathFollow2D.unit_offset)
	
func send_signal():
	$Tween.interpolate_property($PathFollow2D, "unit_offset", 0, 1, 5)
	if not $Tween.is_active():
		$Tween.start()


func _on_Tween_tween_completed(object, key):
	queue_free()
