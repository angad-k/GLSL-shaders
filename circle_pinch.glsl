float circle(in vec2 _st, in float radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(radius-(radius*0.01), 
                        radius+(radius*0.01),
                        dot(l,l)*4.0);
}

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main()
{
    vec2 uv = gl_FragCoord.xy/max(iResolution.x, iResolution.y);
        
    vec2 mp = vec2(sin(iTime)*0.25, cos(iTime)*0.25) + 0.5;
    vec2 offset = uv - mp;
    offset /= length(offset)*max(iResolution.x, iResolution.y);
    offset *= 10.0;
    uv += offset;
    vec2 mp2 = vec2(sin(iTime + 1.57079632679)*0.25, cos(iTime + 1.57079632679)*0.25) + 0.5;
    vec2 offset2 = uv - mp2;
    offset2 /= length(offset2)*max(iResolution.x, iResolution.y);
    offset2 *= 10.0;
    uv += offset2;

    vec2 mp3 = vec2(sin(iTime + 3.14159265359)*0.25, cos(iTime + 3.14159265359)*0.25) + 0.5;
    vec2 offset3 = uv - mp3;
    offset3 /= length(offset3)*max(iResolution.x, iResolution.y);
    offset3 *= 10.0;
    uv += offset3; 
    
    vec2 mp4 = vec2(sin(iTime + 4.712388)*0.25, cos(iTime + 4.712388)*0.25) + 0.5;
    vec2 offset4 = uv - mp4;
    offset4 /= length(offset4)*max(iResolution.x, iResolution.y);
    offset4 *= 10.0;
    uv += offset4; 

    vec2 mp5 = iMouse.xy/max(iResolution.x, iResolution.y);
    vec2 offset5 = uv - mp5;
    offset5 /= length(offset5)*max(iResolution.x, iResolution.y);
    offset5 *= 20.0;
    uv += offset5;

    vec2 st = uv*15.0;

    st = fract(st);
    vec3 color = vec3(circle(st, 0.5)*uv.x, circle(st, 0.5)*uv.y, 0.0);
    //vec3 color = vec3(circle(st, 0.5), circle(st, 0.5), 0.0);
    gl_FragColor = vec4(color, 1.0);
}