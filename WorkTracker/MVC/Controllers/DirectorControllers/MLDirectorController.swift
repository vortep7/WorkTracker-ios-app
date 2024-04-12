//
//  MLDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit
import AVKit
import Vision

class MLDirectorController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var authView: MLDirectorView {return self.view as! MLDirectorView}
    var captureSession: AVCaptureSession?
    var model = Resnet50().model
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigCamera()
        
        view.addSubview(authView.myView)
        view.addSubview(authView.label)
        view.addSubview(authView.secondLabel)
        
        authView.myView.clipsToBounds = true
        authView.myView.layer.cornerRadius = 15.0
        authView.myView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
            guard let firstObservation = results.first else {return}
            
            var name: String = firstObservation.identifier
            var acc: Int = Int(firstObservation.confidence * 100)
            
            DispatchQueue.main.async {
                self.authView.label.text = "Object: \(name)%"
                if name.contains("computer") || name.contains("keybord") || name.contains("monitor"){
                    let alertController = UIAlertController(title: "Computer Detected", message: "A computer was detected on the screen.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
                self.authView.secondLabel.text = "Accuracy: \(acc)%"
            }
            
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

    
    override func loadView() {
        self.view = MLDirectorView(frame: UIScreen.main.bounds)
    }
    
    func startCamera() {
        captureSession?.startRunning()
    }
    
    func stopCamera() {
        captureSession?.stopRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCamera()
        print("start")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopCamera()
        print("stop")
    }
    
    
    func setupConfigCamera() {
        captureSession = AVCaptureSession()

        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession?.addInput(input)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let  dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession?.addOutput(dataOutput)
    }
    
}


