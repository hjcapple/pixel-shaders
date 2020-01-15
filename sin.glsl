// https://thebookofshaders.com/05/?lan=ch

#define PI 3.14159265359

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) - smoothstep(pct, pct + 0.02, st.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 st = fragCoord.xy / iResolution.xy;
    float y = sin(st.x * 6.0 * PI + iTime) * 0.3 + 0.5;
    vec3 color = vec3(st.x);

    float pct = plot(st, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    fragColor = vec4(color, 1.0);
}
