uniform sampler2D u_Texture;
uniform sampler2D u_Mask;
uniform lowp int u_Mode;

varying lowp vec4 frag_Color;
varying lowp vec2 frag_TexCoord;

void main(void) {
    highp vec4 maskColor = texture2D(u_Mask, frag_TexCoord);
    highp vec4 texColor = texture2D(u_Texture, frag_TexCoord);
    
    if(u_Mode == 1){
        if(maskColor.r == 1.0 && maskColor.g == 0.0 && maskColor.b == 0.0){
            gl_FragColor = vec4(texColor.r, texColor.g, texColor.b, texColor.a);
        } else{
            gl_FragColor = vec4(1.0,1.0,1.0,1.0);
        }
    } else {
        gl_FragColor = vec4(texColor.r, texColor.g, texColor.b, texColor.a);
    }
    
    if(maskColor.r == 0.0 && maskColor.g == 0.0 && maskColor.b == 0.0){
        gl_FragColor = vec4(0.0,0.0,0.0,1.0);
    }
}
