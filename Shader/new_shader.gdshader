shader_type canvas_item;
uniform vec2 offset = vec2(0.0,1.0);

void fragment() {
	vec4 pixelcolor = texture(TEXTURE,UV + offset);
	COLOR = pixelcolor;
}
