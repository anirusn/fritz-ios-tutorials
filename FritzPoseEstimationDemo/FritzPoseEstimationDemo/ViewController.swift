//
//  ViewController.swift
//  FritzStyleTransferDemo
//
//  Created by Christopher Kelly on 9/12/18.
//  Copyright © 2018 Fritz. All rights reserved.
//

import UIKit
import Photos
import Fritz

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

  var previewView: UIImageView!

  lazy var poseModel = FritzVisionPoseModel()

  lazy var poseSmoother = PoseSmoother<OneEuroPointFilter>()

  private lazy var captureSession: AVCaptureSession = {
    let session = AVCaptureSession()

    guard
      let backCamera = AVCaptureDevice.default(
        .builtInWideAngleCamera,
        for: .video,
        position: .back),
      let input = try? AVCaptureDeviceInput(device: backCamera)
      else { return session }
    session.addInput(input)

    // The style transfer takes a 640x480 image as input and outputs an image of the same size.
    session.sessionPreset = AVCaptureSession.Preset.vga640x480
    return session
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Add preview View as a subview
    previewView = UIImageView(frame: view.bounds)
    previewView.contentMode = .scaleAspectFill
    view.addSubview(previewView)

    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA as UInt32]
    videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "MyQueue"))
    self.captureSession.addOutput(videoOutput)
    self.captureSession.startRunning()

    videoOutput.connection(with: .video)?.videoOrientation = .portrait
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    previewView.frame = view.bounds
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func displayInputImage(_ sampleBuffer: CMSampleBuffer) {
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
    let image = UIImage(pixelBuffer: pixelBuffer)
    DispatchQueue.main.async {
      self.previewView.image = image
    }
  }

  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {

    let fritzImage = FritzVisionImage(buffer: sampleBuffer)

    let options = FritzVisionPoseModelOptions()
    options.minPoseThreshold = 0.4

    guard let result = try? poseModel.predict(fritzImage, options: options) else {
      // If there was no pose, display original image
      displayInputImage(sampleBuffer)
      return
    }

    guard var pose = result.decodePose() else {
      displayInputImage(sampleBuffer)
      return
    }

    // Uncomment to use pose smoothing to smoothe output of model.
    // Will increase lag of pose a bit.
    // pose = poseSmoother.smoothe(pose)

    guard let poseResult = result.drawPose(pose) else {
      displayInputImage(sampleBuffer)
      return
    }

    // if let smoothed = result.drawPose() {

    DispatchQueue.main.async {
      self.previewView.image = poseResult
    }



  }
}
