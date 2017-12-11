attribute vec4 a_Position;
attribute vec2 a_texCoord;

uniform vec4 u_Color;
uniform highp mat4 u_modelViewMatrix;
uniform highp mat4 u_projectionMatrix;

varying lowp vec4 frag_Color;
varying highp vec2 frag_TexCoord;

void main(void) {
    frag_Color = u_Color;
    frag_TexCoord = a_texCoord;
    gl_Position = u_projectionMatrix * u_modelViewMatrix * a_Position;
}
