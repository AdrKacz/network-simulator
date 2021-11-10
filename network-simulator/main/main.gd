extends Node2D

export (PackedScene) var connection_scene : PackedScene
export (PackedScene) var device_scene : PackedScene

var _buffer_device_name : String

func _input(event):
	if event.is_action_released("create"):
		var device = device_scene.instance()
		device.global_position = get_global_mouse_position()
		device.connect("connect", self, "_on_device_connect")
		$Devices.add_child(device)

func _on_device_connect(position : Vector2, name: String):	
	if _buffer_device_name:
		print('Connection')
		# Get endpoints
		var from : Area2D = $Devices.get_node(name)
		var to : Area2D = $Devices.get_node(_buffer_device_name)
		
		# Create connection
		var connection = connection_scene.instance()
		connection.add_enpoints(to.position, from.position)
		$Connections.add_child(connection)
		print(connection.name)
		# Assign  connection
		from.add_connection(connection.name)
		to.add_connection(connection.name)
		
		# Reset buffer
		_buffer_device_name = ''
		
		connection.send_signal()
	else:
		_buffer_device_name = name
