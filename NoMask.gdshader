shader_type canvas_item;
varying vec4 modulate;

void vertex() {
	modulate = COLOR;
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 alpha = texture(TEXTURE, UV);
    if(alpha.r <= 0.1 && alpha.g <= 0.1 && alpha.b <= 0.1) {
        alpha.a = 0.0;
    }
	
	COLOR.a = alpha.a;
	COLOR = modulate * COLOR;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
