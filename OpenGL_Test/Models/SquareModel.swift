//
//  SquareModel.swift
//  OpenGL_Test
//
//  Created by Vladimir on 04.12.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//

import GLKit

class Square:ObjectModel{
    
    var rectangle: [Vertex] = [
        Vertex(0.0, 0.0, 0, 1.0, 1.0, 1.0, 1.0, 0, 0),
        Vertex(0.0,  1.0, 0, 1.0, 1.0, 1.0, 1.0, 0, 1),
        Vertex( 1.0,  1.0, 0, 1.0, 1.0, 1.0, 1.0, 1, 1),
        Vertex( 1.0, 0.0, 0, 1.0, 1.0, 1.0, 1.0, 1, 0)
    ]

    let indexList: [GLubyte] = [
        0, 1, 2,
        2, 3, 0
    ]
    

    init(shader: ComplexShader) {
        super.init(name: "Square", shader: shader, vertices: rectangle, indices: indexList)
    }
}
