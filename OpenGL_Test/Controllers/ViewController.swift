//
//  ViewController.swift
//  OpenGL_Test
//
//  Created by Vladimir on 29.11.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//

import UIKit
import GLKit

class ViewController: UIViewController {

    var model:Model!
    
    @IBOutlet weak var glkView: GLKView!
    
    override func viewDidLoad() {
        model = Model()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: buttons actions
extension ViewController {
    @IBAction func saveBtnPressed(_ sender: Any) {
        model.saveImage()
    }
    
    @IBAction func modeBtnPressed(_ sender: Any) {
        model.switchMode()
    }
    
    @IBAction func openBtnPressed(_ sender: Any) {
        model.loadImage()
    }
}

