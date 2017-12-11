//
//  Model.swift
//  OpenGL_Test
//
//  Created by Vladimir on 29.11.2017.
//  Copyright © 2017 Vladimir Ageev. All rights reserved.
//
import UIKit
import Photos

class Model{
    
    var image:UIImage?
    var mode: DrawMode = .blackAndWhite
    
    static func save(image: UIImage?){
        guard let photoToBeSaved = image else{
            print("Got nil image")
            return
        }
        
        guard let jpgData = UIImageJPEGRepresentation(photoToBeSaved, 1) else {
            print("Error while saving a file")
            return
        }
            
            // Add metadata to jpgData
        guard let source = CGImageSourceCreateWithData(jpgData as CFData, nil),
            let uniformTypeIdentifier = CGImageSourceGetType(source) else {
                print("Error while fixing image metadata")
                return
        }
            
        let finalData = NSMutableData(data: jpgData)
            
        guard let destination = CGImageDestinationCreateWithData(finalData, uniformTypeIdentifier, 1, nil) else {
            print("Error while fixing image metadata")
            return
        }
            
        CGImageDestinationAddImageFromSource(destination, source, 0, nil)
            
        guard CGImageDestinationFinalize(destination) else {
            print("Error while fixing image metadata")
            return
        }
            
        PHPhotoLibrary.shared().performChanges({
            let creationRequest = PHAssetCreationRequest.forAsset()
                creationRequest.addResource(with: .photo, data: finalData as Data, options: nil)
        },
                                               completionHandler: {success, error in
                                                if success {
                                                    print("Image saved!")
                                                }
            })
    }

    func loadImage(){
        
    }
    func switchMode(){
        if self.mode == .blackAndWhite {
            self.mode = .full
        } else {
            self.mode = .blackAndWhite
        }
    }
}
