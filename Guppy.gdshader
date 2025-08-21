shader_type canvas_item;

uniform sampler2D mask;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 alpha = texture(TEXTURE, UV);
	vec4 maskchart = texture(mask, UV);
    if(maskchart.r <= 0.1 && maskchart.g <= 0.1 && maskchart.b <= 0.1) {
        alpha.a = 0.0;
    }
	
	COLOR.a = alpha.a;
}
//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
