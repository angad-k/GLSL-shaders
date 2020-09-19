
#define MAX_ITERATIONS 20.0

vec2 mandelbrot(vec2 z, float time)
{   
    vec2 count;
    for (float i = 0.0; i < MAX_ITERATIONS; i++)
    {
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) - z*sin(time*0.1)*2.0;
        if(length(z) > 2.0)
        {
            break;
        }
        count += z;
    }
    return count/MAX_ITERATIONS;
}


void main()
{
    vec2 uv = gl_FragCoord.xy/max(iResolution.x, iResolution.y);
    //uv.x -= abs(sin(iTime/10.0))*0.5;
    uv.x -= abs(1.0)*0.5;
    //uv.y -= 0.5;
    uv.xy = uv.yx;
    //uv.x -= 1.0;
    
    float time = abs(sin(iTime/10.0))*4.0 + 6.0;
    uv.xy /= (sin(time*0.5 + 0.5)*0.05 + 1.0);
    vec2 count = mandelbrot(uv, time);
    vec2 count2 = mandelbrot(count + 0.5*sin(iTime*0.1), time);
    vec2 count3 = mandelbrot(count + 0.5*cos(iTime*0.1), time);
    vec4 color = vec4(length(count)*4.0,length(count2)*4.0, length(count3)*4.0, 1.0);
    gl_FragColor = color;
}