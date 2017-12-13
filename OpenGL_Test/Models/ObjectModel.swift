//
//  ObjectModel.swift
//  OpenGL_Test
//
//  Created by Vladimir on 04.12.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//

import GLKit

class ObjectModel: BaseModel {
    var texture: GLuint = 0
    var mask: GLuint = 0
    var complexShader: ComplexShader
    
    init(name: String, shader: ComplexShader, vertices: [Vertex], indices: [GLubyte]){
        self.complexShader = shader
        super.init(name: name, shader: shader as Base, vertices: vertices, indices: indices)
    }


    
    override func renderWithParentModelViewMatrix(_ parentModelViewMatrix: GLKMatrix4 = GLKMatrix4Identity) {
        let modelViewMatrix : GLKMatrix4 = GLKMatrix4Multiply(parentModelViewMatrix, modelMatrix ?? generateModelMatrix())
        complexShader.modelViewMatrix = modelViewMatrix
        complexShader.texture = self.texture
        complexShader.mask = self.mask

        complexShader.prepareToDraw()
        
        glBindVertexArrayOES(vao)
        glDrawElements(GLenum(GL_TRIANGLES), GLsizei(indices.count), GLenum(GL_UNSIGNED_BYTE), nil)
        glBindVertexArrayOES(0)
    }
    
    func loadTexture(name: GLuint) {
        self.texture = name
    }
}
