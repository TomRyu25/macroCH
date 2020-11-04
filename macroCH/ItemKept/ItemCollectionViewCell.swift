//
//  ItemCollectionViewCell.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 03/11/20.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setup()
    }
    
//    func setup() {
//        let view = loadViewFromNib()
//        view.frame = bounds
//        addSubview(view)
//    }
//
//    func loadViewFromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "collectionItemCollectionViewCell", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        return view
//    }
}
