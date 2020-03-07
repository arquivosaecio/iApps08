//
//  GetImagesViewController.swift
//  Projeto 26 - Camera Galeria
//
//  Created by Master Mac on 09/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class GetImagesViewController: UtilAppDelegateViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var imagePickerController = UIImagePickerController()
    var utilImage = UtilImage()
    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fotoTap = UITapGestureRecognizer(target: self, action: #selector(self.fotoButtonAction))
        fotoImageView.addGestureRecognizer(fotoTap)
        fotoImageView.isUserInteractionEnabled = true
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        fotoImageView.image = utilImage.getImage(fileName: "foto.jpg")
    }
    
    // Capturou foto
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let info = utilImage.convertFromUIImagePickerControllerInfoKeyDictionary(info)
        self.dismiss(animated: true, completion: nil)
        fotoImageView.image = info[utilImage.convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
        utilImage.saveImageDocumentDirectory(imagem: fotoImageView.image!, fileName: "foto.jpg")
    }
    
    // Cancelou
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func fotoButtonAction(){
        
        let fotoActionSheet = UIAlertController(title: "Origem da foto", message: "Selecione", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Câmera", style: .default) { (void) in
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }else{
                self.app.utilAlerta.mensagem(titulo: "Erro", mensagem: "Câmera Indisponível!", view: self)
            }
        }
        let galeriaAction = UIAlertAction(title: "Galeria", style: .default) { (void) in
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
                self.imagePickerController.sourceType = .photoLibrary
                self.present(self.imagePickerController, animated: true, completion: nil)
            }else{
                self.app.utilAlerta.mensagem(titulo: "Erro", mensagem: "Galeria Indisponível!", view: self)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (void) in
            
        }
        fotoActionSheet.addAction(cameraAction)
        fotoActionSheet.addAction(galeriaAction)
        fotoActionSheet.addAction(cancelAction)
        present(fotoActionSheet, animated: true, completion: nil)
        
    }
    
}


