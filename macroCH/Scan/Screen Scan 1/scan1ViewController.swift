//
//  scan1ViewController.swift
//  macroCH
//
//  Created by tommy on 08/11/20.
//

import UIKit

class scan1ViewController: UIViewController {
    
    var image: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enableCamera(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScan2" {
            if let nextViewController = segue.destination as? scan2ViewController {
                nextViewController.selectedImage = image
            }
        }
    }
}

extension scan1ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {image = img}
        picker.dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "toScan2", sender: nil)
    }
    
    
    
}
