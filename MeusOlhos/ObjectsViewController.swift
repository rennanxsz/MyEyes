//
//  ObjectsViewController.swift
//  MeusOlhos
//
//  Created by Eric Brito
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit
import AVKit

class ObjectsViewController: UIViewController {
    
    @IBOutlet weak var viCamera: UIView!
    @IBOutlet weak var lbIdentifier: UILabel!
    @IBOutlet weak var lbConfidence: UILabel!
    
    lazy var captureManager: CaptureManager = {
        let captureManager = CaptureManager()
        captureManager.videoBufferDelegate = self
        return captureManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func analyse(_ sender: UIButton) {
    }
}

extension ObjectsViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        <#code#>
    }
}
