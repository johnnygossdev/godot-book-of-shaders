shader_type canvas_item;

uniform float PI = 3.14159265359;

uniform vec2 u_position;
uniform vec2 u_size;
uniform vec2 u_resolution_screen;
uniform vec2 u_mouse_screen;

uniform vec3 colorA = vec3(1.0, 0.5, 0.6);
uniform vec3 colorB = vec3(0.0, 0.2, 0.4);

float plot(vec2 st, float pct){
	return 	smoothstep(pct - 0.02, pct, st.y) -
			smoothstep(pct, pct + 0.02, st.y);
	}

void fragment()
{
	vec2 st = 1.0 - UV;
	st.x = 1.0 - st.x;
	vec3 color = vec3(0.0);
	
	vec3 pct = vec3(st.x);
	// Sunrise and Sunset
    pct.r = smoothstep(abs(sin(TIME*0.25)) * 0.25, 1.0, st.y);
    pct.g = 1.0 - abs(sin(TIME/2.0))*0.5;
    pct.b = 0.6 - pow(st.x, 9.7);

    color = mix(colorA, colorB, pct);

    // Plot transition lines for each channel
    color = mix(color,vec3(1.0,0.0,0.0), plot(st,pct.r));
    color = mix(color,vec3(0.0,1.0,0.0), plot(st,pct.g));
    color = mix(color,vec3(0.0,0.0,1.0), plot(st,pct.b));
	
	COLOR = vec4(color, 1.0);
	
	
}