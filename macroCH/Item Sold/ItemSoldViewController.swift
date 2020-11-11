//
//  ItemSoldViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 06/11/20.
//

import UIKit

class ItemSoldViewController: UIViewController {
    
    @IBOutlet weak var collectionViewItemSold: UICollectionView!
    
    @IBOutlet weak var nowBtnOutlet: UIButton!
    @IBOutlet weak var nowUnderline: UIView!
    
    @IBOutlet weak var historyBtnOutlet: UIButton!
    @IBOutlet weak var historyUnderline: UIView!
    
    
    var itemsToSell: [Baju] = [
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init(),
        .init()
    ]
    
    var nowHistory: Bool = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // collection view setup
        
        collectionViewItemSold.delegate = self
        collectionViewItemSold.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell",bundle: nil)
        self.collectionViewItemSold.register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        //navigation bar set up
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.title = "Kept"
        
        //setup now view
        nowBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        historyUnderline.isHidden = true


    }
    @IBAction func nowBtn(_ sender: Any) {
        //nowbtn format
        nowBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        nowUnderline.isHidden = false
        
        //historybtn format
        historyBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        historyUnderline.isHidden = true
        
        //collectionview change data
        reloadCollectionView()
        nowHistory = true
    }
    @IBAction func historyBtn(_ sender: Any) {
        //history format
        historyBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        historyUnderline.isHidden = false
        
        //nowbtn format
        nowBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        nowUnderline.isHidden = true
        
        //collectionview change data
        reloadCollectionView()
        nowHistory = false
    }
    
    func reloadCollectionView() {
        collectionViewItemSold.reloadData()
    }
    
    func currentTime(time: Date) -> String {
        if (time.toString(dateFormat: "dd-MM-yyyy") == Date().toString(dateFormat: "dd-MM-yyyy")) {
            return "Today"
        } else if (time.toString(dateFormat: "dd-MM-yyyy") ==  Date.yesterday.toString(dateFormat: "dd-MM-yyyy")) {
            return "Yesterday"
        } else {
            return time.toString(dateFormat: "dd-MM-yyyy")
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

}


extension ItemSoldViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionViewItemSold.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemKeptCollectionReusableView", for: indexPath) as? ItemKeptCollectionReusableView{
            
            sectionHeader.headerLabelItemKeptCollectionReusableView.text = "Section \(indexPath.section)"
            
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToSell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewItemSold.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        let selectedItem = itemsToSell[indexPath.section]
        
        cell.name.text = selectedItem.name
        cell.image.image = UIImage(named: "makeAChange")
        
        cell.layer.cornerRadius = 20.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ItemSoldDetailViewController") as? ItemSoldDetailViewController
        vc?.itemContainer = itemsToSell[indexPath.section]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}


extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
