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
        
        let test = Onboarding(frame: CGRect(x: 20, y: 0, width: 374, height: 818))
        self.view.addSubview(test)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
