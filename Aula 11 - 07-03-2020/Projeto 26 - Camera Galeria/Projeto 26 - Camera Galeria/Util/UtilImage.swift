//
//  UtilImage.swift
//  Projeto 21
//
//  Created by Master Mac on 23/10/17.
//  Copyright © 2017 Master Mac. All rights reserved.
//

import UIKit

class UtilImage: NSObject {
    
    func saveImageDocumentDirectory(imagem : UIImage, fileName : String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(fileName)
        print(paths)
        let imageData = imagem.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func getImage(fileName : String) -> UIImage {
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(fileName)
        if fileManager.fileExists(atPath: imagePAth){
            return UIImage(contentsOfFile: imagePAth)!
        }else{
            return UIImage(imageLiteralResourceName: "instagram-logo.png")
        }
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func createDirectory(customDirectory : String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(customDirectory)
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    
    func deleteDirectory(customDirectory : String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(customDirectory)
        if fileManager.fileExists(atPath: paths){
            try! fileManager.removeItem(atPath: paths)
        }else{
            print("Something wronge.")
        }
    }
    
    func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }

    func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }

}
