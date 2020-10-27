//
//  HomeScreenCollectionViewCell.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 27/10/20.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageHomeScreenCollectionView: UIImageView!
    @IBOutlet weak var cellLabelHomeScreenCollectionView: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    //gradient setup
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect.zero
       return gradientLayer
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //gradient call
        gradientView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = gradientView.bounds
        
        //rounded corner
        cellImageHomeScreenCollectionView.layer.cornerRadius = 20
        gradientView.layer.cornerRadius = 20
    }
    
    
}
