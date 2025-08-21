shader_type canvas_item;

uniform sampler2D diffuse : filter_nearest;

void vertex() {
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 alpha = texture(TEXTURE, UV);

    if(alpha.r == 0.0 && alpha.g == 0.0 && alpha.b == 0.0) {
        alpha.a = 0.0;
    }
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
