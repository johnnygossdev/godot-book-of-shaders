extends Sprite


func _process(delta):
	
	set_shader_uniforms()


func _input(event):
	
	if event is InputEventMouse:
		material.set_shader_param("u_mouse_screen", event.position)


func set_shader_uniforms():
	material.set_shader_param("u_position", position)
	material.set_shader_param("u_size", texture.get_size())
	material.set_shader_param("u_resolution_screen", get_viewport().size)