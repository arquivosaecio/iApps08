//
//  ViewController.swift
//  Projeto 19 - Video Player
//
//  Created by iApps on 07/12/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let utilVideoPlayer = UtilVideoPlayer()
    
    @IBAction func video1ButtonAction(_ sender: UIButton) {
        utilVideoPlayer.playLocalFile(view: self, fileName: "video1.mp4")
    }
    
    @IBAction func video2ButtonAction(_ sender: UIButton) {
        utilVideoPlayer.playLocalFile(view: self, fileName: "video2.mp4")
    }
    
    @IBAction func webVideoButtonAction(_ sender: UIButton) {
        utilVideoPlayer.playUrlFile(view: self, fileUrl: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

