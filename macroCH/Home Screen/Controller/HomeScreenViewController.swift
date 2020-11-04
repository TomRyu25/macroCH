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
    
    @IBOutlet weak var donationPlaceViewOutlet: UIView!
    @IBOutlet weak var donationPlaceImageViewOutlet: UIImageView!
    
    @IBOutlet weak var newsTitle1ViewOutlet: UIView!
    @IBOutlet weak var newsTitle1LabelOutlet: UILabel!
    @IBOutlet weak var newsTitle1ImageOutlet: UIImageView!
    
    @IBOutlet weak var newsTitle2ViewOutlet: UIView!
    @IBOutlet weak var newsTitle2LabelOutlet: UILabel!
    @IBOutlet weak var newsTitle2ImageOutlet: UIImageView!
    
    @IBOutlet weak var newsTitle3ViewOutlet: UIView!
    @IBOutlet weak var newsTitle3LabelOutlet: UILabel!
    @IBOutlet weak var newsTitle3ImageOutlet: UIImageView!
    
    
//    @IBOutlet weak var donationNewsCollectionViewOutlet: UICollectionView!
//    let homeScreenCollectionViewCellId = "HomeScreenCollectionViewCell"
    
    
    var newsData: [News] = [
        News(title: "News Title 1", details: "asdfasdf", content: "asdfasdfasdf", date: Date()),
        News(title: "News Title 2", details: "qwerqwer", content: "qwerqwerqwer", date: Date()),
        News(title: "News Title 3", details: "zxcvzxcv", content: "zxcvzxcvzxcv", date: Date())
    ]
    
    
    //gradient setup
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect.zero
        
        return gradientLayer
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadHomeScreen()
    }
    
    
    func loadHomeScreen() {
//        //set up collection view
//        donationNewsCollectionViewOutlet.delegate = self
//        donationNewsCollectionViewOutlet.dataSource = self
        
        //implement user data
        userNameLabelOutlet.text = userName
        userProfileImageOutlet.image = userProfileImage
        
        //implement news data
        newsTitle1LabelOutlet.text = newsData[0].title
        newsTitle2LabelOutlet.text = newsData[1].title
        newsTitle3LabelOutlet.text = newsData[2].title
        
        //apply rounded corner
        roundedCornerHomeScreen()
        
//        //register cell
//        let nibCell = UINib(nibName: homeScreenCollectionViewCellId, bundle: nil)
//        donationNewsCollectionViewOutlet.register(nibCell, forCellWithReuseIdentifier: homeScreenCollectionViewCellId)
        
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
        
        donationPlaceViewOutlet.layer.cornerRadius = 20
        
        newsTitle1ViewOutlet.layer.cornerRadius = 20
        newsTitle1ImageOutlet.layer.cornerRadius = 20
        
        newsTitle2ViewOutlet.layer.cornerRadius = 20
        newsTitle2ImageOutlet.layer.cornerRadius = 20
        
        newsTitle3ViewOutlet.layer.cornerRadius = 20
        newsTitle3ImageOutlet.layer.cornerRadius = 20
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

//extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return newsData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset: CGFloat = 10
//        let insetlr: CGFloat = 0
//        return UIEdgeInsets(top: inset, left: insetlr, bottom: inset, right: insetlr)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 354, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeScreenCollectionViewCellId, for: indexPath) as! HomeScreenCollectionViewCell
//        let news = newsData[indexPath.row]
//        cell.cellNewsTitleLabelHomeScreenCollectionView.text = news.title
//
//
//        //gradient call
//        cell.gradientView.layer.addSublayer(gradientLayer)
//        gradientLayer.frame = cell.gradientView.bounds
//
//        //rounded corner
//        cell.cellImageHomeScreenCollectionView.layer.cornerRadius = 20
//        cell.gradientView.layer.cornerRadius = 20
//
//        return cell
//    }
//}
