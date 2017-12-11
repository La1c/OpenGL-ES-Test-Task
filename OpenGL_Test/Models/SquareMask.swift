//
//  SquareMask.swift
//  OpenGL_Test
//
//  Created by Vladimir on 06.12.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//

import GLKit

class SquareMask:BaseModel{
    var imgWidth: GLsizei = 1600
    var imgHeight: GLsizei = 900
    
    
    
    var rectangle: [Vertex] = [
        //x, y, z,  r, g, b, a,  u, v
        Vertex(0.0, 0.0, 0, 1.0, 0.0, 0.0, 1.0, 0, 0),
        Vertex(0.0,  1, 0, 1.0, 0.0, 0.0, 1.0, 0, 1),
        Vertex(1,  1, 0, 1.0, 0.0, 0.0, 1.0, 1, 1),
        Vertex(1, 0, 0, 1.0, 0.0, 0.0, 1.0, 1, 0)
    ]
    
    let indexList: [GLubyte] = [
        0, 1, 2,
        2, 3, 0
    ]
    
    init(shader: Base = Base(vertexShader: "SimpleVertex.glsl", fragmentShader: "SimpleFragment.glsl")) {
        super.init(name: "MaskedSquare", shader: shader, vertices: rectangle, indices: indexList)
        self.position = GLKVector3Make(100, 100, 0)
        self.scaleX = 500
        self.scaleY = 500
    }
    
    convenience init (shader: Base = Base(vertexShader: "SimpleVertex.glsl", fragmentShader: "SimpleFragment.glsl"),
                      width: GLsizei, height: GLsizei){
        self.init(shader: shader)
        self.imgHeight = height
        self.imgWidth = width
        self.shader.projectionMatrix = GLKMatrix4MakeOrtho(0, Float(width), 0, Float(height), 0, 1)
        self.shader.color = GLKVector4Make(1.0, 0.0, 0.0, 1.0)
    }
}
