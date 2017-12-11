//
//  BaseEffect.swift
//  OpenGL_Test
//
//  Created by Vladimir on 01.12.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//

import GLKit
import Foundation

class ComplexShader: Base{
    var textureUniform : Int32 = 0
    var maskUniform : Int32 = 0
    var modeUniform: Int32 = 0
    
    var texture: GLuint = 0
    var mask : GLuint = 0
    var mode : GLint = 1
    
    
    override func prepareToDraw(){
        glUseProgram(self.programHandle)
        glUniformMatrix4fv(self.projectionMatrixUniform, 1, GLboolean(GL_FALSE), self.projectionMatrix.array)
        glUniformMatrix4fv(self.modelViewMatrixUniform, 1, GLboolean(GL_FALSE), self.modelViewMatrix.array)
          

        glActiveTexture(GLenum(GL_TEXTURE1))
        glBindTexture(GLenum(GL_TEXTURE_2D), self.texture)
        glUniform1i(self.textureUniform, 1)
        
        glActiveTexture(GLenum(GL_TEXTURE0))
        glBindTexture(GLenum(GL_TEXTURE_2D), self.mask)
        glUniform1i(self.maskUniform, 0)
        
        glUniform1i(self.modeUniform, self.mode)
    }
    
    override func compile(vertexShader: String, fragmentShader: String){
        
        attachShaders(vertexShader: vertexShader, fragmentShader: fragmentShader)
        glBindAttribLocation(self.programHandle, VertexAttributes.position.rawValue, "a_position")
        glBindAttribLocation(self.programHandle, VertexAttributes.color.rawValue, "a_color")
        glBindAttribLocation(self.programHandle, VertexAttributes.texCoord.rawValue, "a_texCoord")
        
        glLinkProgram(self.programHandle)
        self.modelViewMatrixUniform = glGetUniformLocation(self.programHandle, "u_modelViewMatrix")
        self.projectionMatrixUniform = glGetUniformLocation(self.programHandle, "u_projectionMatrix")
        self.textureUniform = glGetUniformLocation(self.programHandle, "u_Texture")
        self.maskUniform = glGetUniformLocation(self.programHandle, "u_Mask")
        self.modeUniform = glGetUniformLocation(self.programHandle, "u_Mode")
        link()
    }
}
