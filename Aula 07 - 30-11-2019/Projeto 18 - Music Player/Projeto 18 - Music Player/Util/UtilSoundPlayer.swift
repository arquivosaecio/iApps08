//
//  UtilSoundPlayer.swift
//  Projeto 18 - Music Player
//
//  Created by Master Mac on 18/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit
import AVFoundation

class UtilSoundPlayer: NSObject  , AVAudioPlayerDelegate {
    
    var player : AVAudioPlayer?
    var musicaAtual : String = "Nenhuma"
    var tocando : Bool = false
    
    override init() {
        super.init()
        player?.delegate = self
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        tocando = false
        musicaAtual = "Nenhuma"
    }
    
    func play ( musica : String ){
        
        musicaAtual = musica
        tocando = true
        let path = Bundle.main.path(forResource: musica, ofType: nil)
        if(path != nil){
            let url = NSURL.fileURL(withPath: path!)
            print(url)
            if(player == nil){
                player = try? AVAudioPlayer(contentsOf: url)
            }
            player?.delegate = self
            player?.play()
        }else{
            print("Arquivo inexistente")
        }
        
    }
    
    func pause(){
        
        if(player != nil){
            player?.pause()
            tocando = false
        }
        
    }
    
    func stop(){
        
        if(player != nil){
            player?.stop()
            player = nil
            musicaAtual = "Nenhuma"
            tocando = false
        }
        
    }

}
