shader_type canvas_item;

uniform vec2 u_position;
uniform vec2 u_size;
uniform vec2 u_resolution_screen;
uniform vec2 u_mouse_screen;

void fragment()
{
	// alter st to copy Book of Shaders
	vec2 st = 1.0 - UV;
	st.x = 1.0 - st.x;
	
	// using time
	//COLOR = vec4(abs(sin(TIME*0.5)), 0.0, 0.0, 1.0);
	
	// UV is (0, 0) to (1, 1), top left to bottom right
	COLOR = vec4(st, 0.0, 1.0);
	
	// if the mouse is in the texture, fill based on where the mouse is
	
	if (u_mouse_screen.x > u_position.x 
	&& u_mouse_screen.y > u_position.y 
	&& u_mouse_screen.x < u_position.x + u_size.x
	&& u_mouse_screen.y < u_position.y + u_size.y
	){
		// alter st to copy Book of Shaders
		st = 1.0 - (u_mouse_screen - u_position)/u_size;
		st.x = 1.0 - st.x;
		COLOR = vec4(st, 0.0, 1.0);
	}
	
}