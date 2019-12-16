shader_type canvas_item;

uniform float PI = 3.14159265359;

uniform vec2 u_position;
uniform vec2 u_size;
uniform vec2 u_resolution_screen;
uniform vec2 u_mouse_screen;

float plot(vec2 st, float pct){
	return smoothstep(pct - 0.02, pct, st.y) -
	smoothstep(pct, pct + 0.02, st.y);
	}

void fragment()
{
	vec2 st = 1.0 - UV;
	st.x = 1.0 - st.x;
	
	// change this line to plot y
	//float y = pow(st.x, 2.0);
	
	// Step will return 0.0 unless the value is over 0.5,
    // in that case it will return 1.0
	//float y = step(0.5, st.x);
	
	// Smooth interpolation between 0.1 and 0.9
    //float y = smoothstep(0.1,0.9,st.x);
	
	// Make a vertical line
	//float y = smoothstep(0.2, 0.5, sin(TIME + st.x)) - smoothstep(0.5, 0.8, sin(TIME + st.x));
	
	// Bouncing line
	float y = abs(sin(TIME + st.x));
	
	
	//float y = clamp(sin(TIME + st.x), 0.0, 1.0);
	//float y = ceil(sin(TIME + st.x));
	
	
	vec3 color = vec3(y);
	
	// plot the line
	float pct = plot(st, y);
	
	color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
	
	COLOR = vec4(color, 1.0);
	
	
}