//
//  UtilVideoPlayer.swift
//  Projeto 19 - Video Player
//
//  Created by iApps on 07/12/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class UtilVideoPlayer: NSObject {
    
    func playLocalFile(view : UIViewController , fileName : String){
        
        // if arquivo existe guarda na variavel path, senâo sai fora do método
        guard let path = Bundle.main.path(forResource: fileName, ofType: "") else{
            debugPrint("Arquivo inexistente...")
            return // sai fora do método
        }
        // player de janela... não é tão interesante...
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        // player de tela cheia, que recebe um objeto do player de janela
        let playerController = AVPlayerViewController()
        playerController.player = player
        view.present(playerController, animated: true) {
            player.play()
        }
        
    }
    
    func playUrlFile(view : UIViewController , fileUrl : String){
        let fileUrl = URL(string: fileUrl)! as URL
        let player = AVPlayer(url: fileUrl)
        let playerController = AVPlayerViewController()
        playerController.player = player
        view.present(playerController, animated: true) {
            playerController.player?.play()
        }
    }

}
