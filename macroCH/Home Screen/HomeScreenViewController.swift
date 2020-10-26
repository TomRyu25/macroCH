//
//  HomeScreenViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 26/10/20.
//

import UIKit

class HomeScreenViewController: UIViewController {
    var userName: String = "Marvin Marcopolo"
    var userProfileImage: UIImage = #imageLiteral(resourceName: "profile")
    
    
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var userProfileImageOutlet: UIImageView!
    
    @IBOutlet weak var scanViewOutlet: UIView!
    @IBOutlet weak var scanButtonOutlet: UIButton!
    
    @IBOutlet weak var itemDisposedViewOutlet: UIView!
    @IBOutlet weak var itemDisposedViewIconOutlet: UIView!
    
    @IBOutlet weak var itemKeptViewOutlet: UIView!
    @IBOutlet weak var itemKeptViewIconOutlet: UIView!
    
    @IBOutlet weak var itemDonatedViewOutlet: UIView!
    @IBOutlet weak var itemDonatedViewIconOutlet: UIView!
    
    @IBOutlet weak var itemSoldViewOutlet: UIView!
    @IBOutlet weak var itemSoldViewIconOutlet: UIView!
    
    @IBOutlet weak var donationPlaceViewOutlet: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadHomeScreen()
        // Do any additional setup after loading the view.
    }
    
    
    func loadHomeScreen() {
        //implement user data
        userNameLabelOutlet.text = userName
        userProfileImageOutlet.image = userProfileImage
        
        //apply rounded corner
        roundedCornerHomeScreen()
    }
    
    func roundedCornerHomeScreen() {
        userProfileImageOutlet.layer.cornerRadius = 50
        
        scanViewOutlet.layer.cornerRadius = 20
        scanViewOutlet.layer.cornerRadius = 20
        
        itemDisposedViewOutlet.layer.cornerRadius = 20
        itemDisposedViewIconOutlet.layer.cornerRadius = 20
        
        itemKeptViewOutlet.layer.cornerRadius = 20
        itemKeptViewIconOutlet.layer.cornerRadius = 20
        
        itemDonatedViewOutlet.layer.cornerRadius = 20
        itemDonatedViewIconOutlet.layer.cornerRadius = 20
        
        itemSoldViewOutlet.layer.cornerRadius = 20
        itemSoldViewIconOutlet.layer.cornerRadius = 20
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
