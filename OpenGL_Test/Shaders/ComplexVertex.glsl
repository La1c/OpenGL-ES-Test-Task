//uniform variables have the same value among all procceeded vertices
uniform highp mat4 u_modelViewMatrix;
uniform highp mat4 u_projectionMatrix;

attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord;

varying lowp vec4 frag_Color;
varying lowp vec2 frag_TexCoord;

void main(){
    gl_Position = u_projectionMatrix * u_modelViewMatrix * a_position;
    frag_TexCoord = a_texCoord;
    frag_Color = a_color;
}
