//
//  scan2ViewController.swift
//Users/celita/Desktop/lubangBajuDetector 1.mlmodel/  macroCH
//
//  Created by tommy on 08/11/20.
//

import UIKit
import CoreML
import Vision
import ImageIO

class scan2ViewController: UIViewController {
    
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var labelSuggestion: UILabel!
    var selectedImage: UIImage! = #imageLiteral(resourceName: "Group 3")
    
    
    lazy var detectionRequest: VNCoreMLRequest = {
             do {
                let model = try VNCoreMLModel(for: lubangBajuDetector_1().model)

                 let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                     self?.processDetections(for: request, error: error)
                 })
                 request.imageCropAndScaleOption = .scaleFit
                 return request
             } catch {
                 fatalError("Failed to load Vision ML model: \(error)")
             }
         }()
    
    
    private func updateDectection(for image: UIImage){
        
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))
        guard let ciImage = CIImage(image: image) else {fatalError("Unable to create \(CIImage.self) from \(image).")}
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation!)
            do{
                try handler.perform([self.detectionRequest])
            }catch {
                print("Failed to perform detection.\n\(error.localizedDescription)")
            }
        }
    }
    
    
    private func processDetections(for request: VNRequest, error: Error?) {
            DispatchQueue.main.async {
                guard let results = request.results else {
                    print("Unable to detect anything.\n\(error!.localizedDescription)")
                    return
                }

                let detections = results as! [VNRecognizedObjectObservation]
                self.drawDetectionsOnPreview(detections: detections)
            }
        }
    
    
    
    func drawDetectionsOnPreview(detections: [VNRecognizedObjectObservation]) {
        
        let count = detections.count
        
        if count == 0 {
            labelSuggestion.text = "this is testing label"
        }else{
            labelSuggestion.text = "This shirt has (kondisi) and its time to (suggestion). are you sure you want to (pilihan)"
        }
        
         guard let image = self.selectedImage else {
             return
         }

         let imageSize = image.size
         let scale: CGFloat = 0
         UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)

         image.draw(at: CGPoint.zero)

         for detection in detections {

             print(detection.labels.map({"\($0.identifier) confidence: \($0.confidence)"}).joined(separator: "\n"))
             print("------------")

             let boundingBox = detection.boundingBox
             let rectangle = CGRect(x: boundingBox.minX*image.size.width, y: (1-boundingBox.minY-boundingBox.height)*image.size.height, width: boundingBox.width*image.size.width, height: boundingBox.height*image.size.height)
             UIColor(red: 0, green: 1, blue: 0, alpha: 0.4).setFill()
             UIRectFillUsingBlendMode(rectangle, CGBlendMode.normal)

         }

         let newImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         self.previewImage?.image = newImage
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        updateDectection(for: selectedImage)
        
        
        //tentuin warna
        //if (selectedImage.image?.averageColor){
            
        //}
        
        // Do any additional setup after loading the view.
    }
    
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
