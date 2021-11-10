extends Path2D
signal arrived(frame_name)

export (Texture) var _texture : Texture

onready var tween : Tween = $Tween

func add_enpoints(from : Vector2, to : Vector2):
	curve.clear_points()
	curve.add_point(from)
	curve.add_point(to)
	
func _input(event):
	if event.is_action_pressed("info"):
		pass
	
func send_signal():
	# Create and Add Frame
	var frame : PathFollow2D = PathFollow2D.new()
	var sprite : Sprite = Sprite.new()
	sprite.texture = _texture
	sprite.scale.x = 0.5
	sprite.scale.y = 0.5
	frame.add_child(sprite)
	add_child(frame)
	# Animate Frame
	tween.interpolate_property(frame, "unit_offset", 0, 1, 5)
	if not tween.is_active():
		tween.start()


func _on_Tween_tween_completed(object, key):
	print(object.name, key)
	object.queue_free()
