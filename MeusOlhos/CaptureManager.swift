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
    
    weak var videoBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    
    init() {
        
    }
    
    func startCameraCapture() -> AVCaptureVideoPreviewLayer? {
        if askForPermission() {
            guard let captureDevice = AVCaptureDevice.default(for: .video) else {return nil}
            do {
            let input = try AVCaptureDeviceInput (device: captureDevice)
                captureSession.addInput(input)
            } catch {
                print(error.localizedDescription)
                return nil
                
            }
            captureSession.startRunning()
            let videoDataOutput = AVCaptureVideoDataOutput()
            videoDataOutput.setSampleBufferDelegate(videoBufferDelegate, queue: DispatchQueue(label: "cameraQueue"))
            captureSession.addOutput(videoDataOutput)
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            return previewLayer
        } else {
            return nil
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
