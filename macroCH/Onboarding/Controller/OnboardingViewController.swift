//
//  OnboardingVCViewController.swift
//  macroCH
//
//  Created by Gilbert Gozalie on 11/3/20.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any){
        let storyboard = UIStoryboard(name: "HomeScreenStoryboard", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") //as! HomeScreenViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
