//
//  ViewController.swift
//  Projeto 18 - Music Player
//
//  Created by Master Mac on 18/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = UtilSoundPlayer()
    
    @IBAction func toadsButtonAction(_ sender: UIButton) {
            
            play(musica: "Battletoads.m4a")
            
        }
        
        @IBAction func duckButtonAction(_ sender: UIButton) {
            
            play(musica: "Duck Sauce.m4a")
            
        }
        
        @IBAction func fosterButtonAction(_ sender: UIButton) {
            
            play(musica: "Foster The People.m4a")
            
        }
        
        @IBAction func helloButtonAction(_ sender: UIButton) {
            
            play(musica: "Hello.m4a")
            
        }
        
        @IBAction func keshaButtonAction(_ sender: UIButton) {
            
            play(musica: "Pitbull Kesha.m4a")
            
        }
        
        @IBAction func stopButtonAction(_ sender: UIButton) {
            
            player.stop()
            
        }
    
    func play(musica : String){
        
        if(player.tocando == false){ // nenhum som ou existe alguma música pausada...
            if(player.musicaAtual == musica){ // despausar a música
                player.play(musica: musica)
            }else{ // tocar nova música
                player.stop()
                player.play(musica: musica)
            }
        }else{ // tocando alguma coisa...
            if(player.musicaAtual == musica){ // pausar a música
                player.pause()
            }else{ // começar a tocar uma nova música
                player.stop()
                player.play(musica: musica)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

