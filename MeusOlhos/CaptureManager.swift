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
    func startCameraCapture() -> AVCaptureVideoPreviewLayer? {
        if askForPermission() {
            guard let captureDevice = AVCaptureDevice.default(for: .video) else {return nil}
            
        }
    }
    
    func askForPermission() -> Bool {
        var hasPermission: Bool = true
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            hasPermission = true
        case . notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (sucess) in
                hasPermission = sucess
            })
        case .restricted, .denied:
            hasPermission = false
        }
        
        return hasPermission
   
    }
}
