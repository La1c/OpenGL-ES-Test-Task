varying lowp vec4 frag_Color;
varying highp vec2 frag_TexCoord;

void main(void) {
    if(frag_TexCoord.x < 0.95 && frag_TexCoord.x > 0.05 && frag_TexCoord.y < 0.95 && frag_TexCoord.y > 0.05){
        gl_FragColor = frag_Color;
    } else {
        gl_FragColor = vec4(0.0,0.0,0.0,1.0);
    }
}
