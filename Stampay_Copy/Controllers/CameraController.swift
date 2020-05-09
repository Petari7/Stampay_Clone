//
//  CameraController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 21/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController {
    
let stampayLabel: UILabel = {
let label = UILabel()
label.text = "Stampay GmbH"
label.textAlignment = .center
label.textColor = .white
label.numberOfLines = 0
label.font = UIFont.boldSystemFont(ofSize: 17)
return label
}()
    
    
let botomView: UIView = {
let view = UIView()
view.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
return view
}()
    
let dismissButton: UIButton = {
let button = UIButton(type: .system)
button.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
button.tintColor = .white
button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        
return button
}()
    
let flashOnButton: UIButton = {
let button = UIButton(type: .system)
button.setImage(#imageLiteral(resourceName: "flashOn"), for: .normal)
button.tintColor = .white
button.addTarget(self, action: #selector(setFlashOn(sender:)), for: .touchUpInside)
return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCameraSession()
        setupBottomViews()
    }
    
  
 
    
func setupCameraSession() {
    
let cameraSession = AVCaptureSession()
    
guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
    

    
    do {
         let input = try AVCaptureDeviceInput(device: device)
        if cameraSession.canAddInput(input) {
        cameraSession.addInput(input)
        }
    } catch let err {
        
    print(err.localizedDescription)
        
    }
    
    
    
    let output = AVCapturePhotoOutput()
    
    if cameraSession.canAddOutput(output) {
        cameraSession.addOutput(output)
    }
    
    
    let captureLayer = AVCaptureVideoPreviewLayer(session: cameraSession)
    
    captureLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
    
    captureLayer.frame = self.view.frame
    view.layer.addSublayer(captureLayer)
   
    
    cameraSession.startRunning()
    
    
    
}
    
func setupBottomViews() {
    
view.addSubview(botomView)
    
botomView.setAutoLayout(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 80)

botomView.addSubview(dismissButton)
botomView.addSubview(stampayLabel)
botomView.addSubview(flashOnButton)
    
dismissButton.setAutoLayout(top: botomView.topAnchor, bottom: botomView.bottomAnchor, left: botomView.leftAnchor, right: nil, paddingTop: 0, paddingbottom: 0, paddingLeft: 24, paddingRight: 0, widht: 0, height: 80)

stampayLabel.setAutoLayout(top: dismissButton.topAnchor, bottom: view.bottomAnchor, left: nil, right: nil, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 100, height: 50)
stampayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    
flashOnButton.setAutoLayout(top: stampayLabel.topAnchor, bottom: view.bottomAnchor, left: nil, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 24, widht: 0, height: 80)
    
    
}
    
@objc func handleDismiss() {
    
guard let device = self.device else { return }
    

if device.hasTorch {
        
    do {
    try device.lockForConfiguration()
    } catch {
    print(error.localizedDescription)
    }
    
if device.isTorchActive {
        
    device.torchMode = AVCaptureDevice.TorchMode.off
        
        
        self.dismiss(animated: true, completion: nil)
        
}
        
}
}
    
weak var device: AVCaptureDevice?
    
@objc func setFlashOn(sender: UIButton) {
    
  device = AVCaptureDevice.default(for: AVMediaType.video)
    
    guard let device = device else { return }
  
    if device.hasTorch {
   
        do {
           try device.lockForConfiguration()
        } catch {
            print(error.localizedDescription)
        }
        
        if device.isTorchActive {
            device.torchMode = AVCaptureDevice.TorchMode.off
        } else {
            do {
              try device.setTorchModeOn(level: 1.0)
            } catch {
                print(error.localizedDescription)
            }
       
        }
        device.unlockForConfiguration()
    }
  
}
    
@objc func handleDismissal() {
    
self.dismiss(animated: true, completion: nil)
        
}
    
    
}
