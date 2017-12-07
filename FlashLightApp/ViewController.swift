//
//  ViewController.swift
//  FlashLightApp
//
//  Created by Lance Robbins on 12/6/17.
//  Copyright © 2017 Appcation. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var onOffLbl: UILabel!
    @IBOutlet weak var toggleBtn: UIButton!
    
    var switchStatus: SwitchStatus = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toggleBtnPressed(_ sender: Any) {
        switchStatus.toggle()
        
        if (switchStatus == .off){
            view.backgroundColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
            toggleBtn.setImage(UIImage(named: "offBtn")!, for: .normal)
            onOffLbl.text = "🌚 OFF 🌚"
            onOffLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            toggleFlash()

            
        } else {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            toggleBtn.setImage(UIImage(named: "onBtn")!, for: .normal)
            onOffLbl.text = "🌝 ON 🌝"
            onOffLbl.textColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
            toggleFlash()
        }
    }
    
    func toggleFlash() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if (device != nil) {
            if (device!.hasTorch) {
                do {
                    try device!.lockForConfiguration()
                        if (device!.torchMode == AVCaptureDevice.TorchMode.on) {
                            device!.torchMode = AVCaptureDevice.TorchMode.off
                        } else {
                            do {
                                try device!.setTorchModeOn(level: 1.0)
                                } catch {
                                    print(error)
                                }
                        }
                    
                        device!.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
}
