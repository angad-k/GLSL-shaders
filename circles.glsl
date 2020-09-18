void main()
{
    vec2 uv = gl_FragCoord.xy/iResolution.xy;
    vec2 from_cent = abs(uv.xy - vec2(0.5, 0.5));
    from_cent.y *= 1.2;
    vec2 mouseUV = iMouse.xy/iResolution.xy;
    float dist = length(from_cent);
    float ang = mod((atan(from_cent.y/from_cent.x)), 1.0);
    float ang1 = mod((ang + iTime*0.5), 1.0);
    float ang2 = mod((ang - iTime*0.5), 1.0);
    ang = (1.0 - step(0.2 + sin(iTime)*0.1, dist))*ang2 + step(0.2 + sin(iTime)*0.1, dist)*(ang1+0.4);
    ang = (1.0 - step(0.4 + sin(iTime + 0.2)*0.1, dist))*ang + step(0.4 + sin(iTime + 0.2)*0.1, dist)*ang2;
    ang = (1.0 - step(0.6 + sin(iTime)*0.1, dist))*ang + step(0.6 + sin(iTime)*0.1, dist)*ang1;
    vec4 color = vec4(sin(dist + sin(iTime) + ang), sin(dist + cos(iTime) + ang), 0.5, 0.5);

   gl_FragColor = color;
}
