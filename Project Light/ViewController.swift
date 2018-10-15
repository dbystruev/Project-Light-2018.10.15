//
//  ViewController.swift
//  Project Light
//
//  Created by Denis Bystruev on 15/10/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed() {
        isOn = !isOn
        updateUI()
    }
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        let device = AVCaptureDevice.default(for: .video)
        
        if let device = device {
            do {
                try device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
                view.backgroundColor = .black
            } catch {
                print(error)
            }
        } else {
            view.backgroundColor = isOn ? .white : .black
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

