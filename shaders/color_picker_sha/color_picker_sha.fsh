varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    float sa = dot(v_vColour.rgb, vec3(0.3, 0.59, 0.11));
    vec3 fc = mix(vec3(sa, sa, sa), texture2D(gm_BaseTexture, v_vTexcoord).rgb, v_vTexcoord.r) * (1.0 - v_vTexcoord.g);
    gl_FragColor = vec4(fc, 1.0);
}