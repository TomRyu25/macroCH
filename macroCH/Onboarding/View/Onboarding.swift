//
//  Onboarding.swift
//  macroCH
//
//  Created by Gilbert Gozalie on 11/3/20.
//

import UIKit

class Onboarding: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    @IBAction func button(_ sender: Any){
        let storyboard = UIStoryboard(name: "HomeScreenStoryboard", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! StartViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }

}
