extends Area2D
signal connect(position, name)

var _connections : PoolStringArray

func _input(event):
	if event.is_action_pressed("info"):
		print(name, ' Connected to ', _connections)
		
func add_connection(connection_name):
	_connections.append(connection_name)

func _on_device_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("connect"):
		print('Connect ', name)
		emit_signal("connect", position, name)
