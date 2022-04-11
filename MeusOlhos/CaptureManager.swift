//
//  CaptureManager.swift
//  MeusOlhos
//
//  Created by Rennan Bruno on 10/04/22.
//  Copyright © 2022 Eric Brito. All rights reserved.
//

import Foundation
import AVKit

class CaptureManager {
    
    lazy var captureSession: AVCaptureSession = {
       let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .hd1920x1080
        return captureSession
    }()
    
    init() {
        
    }
    func startCameraCapture() -> 
}
