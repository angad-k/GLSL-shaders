
void main()
{
   vec2 uv = gl_FragCoord.xy/max(iResolution.x, iResolution.y);
   vec2 st = uv*3.0;
   st.x += step(st.y, 1.0)*(iTime);
   st.x -= (1.0-step(st.y, 1.0))*(iTime + 0.7);
   st.x += (1.0-step(st.y, 2.0))*(iTime*2.0);
   st = fract(st);
   vec3 color = vec3(st,0.0);
   gl_FragColor = vec4(color, 1.0);
}