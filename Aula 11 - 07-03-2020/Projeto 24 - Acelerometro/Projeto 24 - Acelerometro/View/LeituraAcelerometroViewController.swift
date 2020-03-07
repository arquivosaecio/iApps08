//
//  LeituraAcelerometroViewController.swift
//  Projeto 24 - Acelerometro
//
//  Created by Master Mac on 09/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit
import CoreMotion

class LeituraAcelerometroViewController: UtilAppDelegateViewController {
    
    var motionManager = CMMotionManager()
    var utilString = UtilString()
    
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @objc func updateView() {
        xLabel.text = utilString.formatar(numero: x, casas: 0)
        yLabel.text = utilString.formatar(numero: y, casas: 0)
        zLabel.text = utilString.formatar(numero: z, casas: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateView), userInfo: nil, repeats: true)
        timer.fire()
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue()
            motionManager.startAccelerometerUpdates(to: queue, withHandler: { (data, error) in
                guard let data = data else{
                    return
                }
                self.x =  UtilAcelerometro.converterP2A(polar: data.acceleration.x)
                self.y =  UtilAcelerometro.converterP2A(polar: data.acceleration.y)
                self.z =  UtilAcelerometro.converterP2A(polar: data.acceleration.z)
            })
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
