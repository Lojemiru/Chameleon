attribute vec2 in_TextureCoord;
attribute vec3 in_Position;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 op = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * op;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

