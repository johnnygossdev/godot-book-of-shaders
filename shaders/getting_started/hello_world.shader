shader_type canvas_item;

uniform vec4 color : hint_color;

vec4 red()
{
	return vec4(1.0, 0.0, 0.0, 1.0);
}

void fragment()
{
	//COLOR = color; //use shader_param color
	
	//COLOR = red(); //use a function for color
	
	COLOR = vec4(1.0, 0.0, 1.0, 1.0);
}