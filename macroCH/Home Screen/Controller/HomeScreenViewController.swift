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
    @IBOutlet weak var donationNewsCollectionViewOutlet: UICollectionView!
    let homeScreenCollectionViewCellId = "HomeScreenCollectionViewCell"
    
    
    var newsData: [News] = [
        News(title: "asdf", details: "asdfasdf", content: "asdfasdfasdf", date: Date()),
        News(title: "qwer", details: "qwerqwer", content: "qwerqwerqwer", date: Date()),
        News(title: "zxcv", details: "zxcvzxcv", content: "zxcvzxcvzxcv", date: Date())
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadHomeScreen()
    }
    
    
    func loadHomeScreen() {
        //implement user data
        userNameLabelOutlet.text = userName
        userProfileImageOutlet.image = userProfileImage
        
        //apply rounded corner
        roundedCornerHomeScreen()
        
        //register cell
        let nibCell = UINib(nibName: homeScreenCollectionViewCellId, bundle: nil)
        donationNewsCollectionViewOutlet.register(nibCell, forCellWithReuseIdentifier: homeScreenCollectionViewCellId)
        
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

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        let insetlr: CGFloat = 0
        return UIEdgeInsets(top: inset, left: insetlr, bottom: inset, right: insetlr)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 354, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeScreenCollectionViewCellId, for: indexPath) as! HomeScreenCollectionViewCell
        let news = newsData[indexPath.row]
        cell.cellNewsTitleLabelHomeScreenCollectionView.text = news.title
        
        return cell
    }
}
