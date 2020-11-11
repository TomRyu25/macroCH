//
//  ItemSoldViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 06/11/20.
//

import UIKit

class ItemDonateViewController: UIViewController {
    
    @IBOutlet weak var collectionViewItemDonate: UICollectionView!
    
    @IBOutlet weak var nowBtnOutlet: UIButton!
    @IBOutlet weak var nowUnderline: UIView!
    
    @IBOutlet weak var historyBtnOutlet: UIButton!
    @IBOutlet weak var historyUnderline: UIView!
    
    
//    fetch item
    var items: [Baju] = [
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
    
    var itemsNow = [[Baju]]()
    var itemsHistory = [[Baju]]()
    
    
    var nowHistory: Bool = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sample data
        items[0].action = 2
        items[1].action = 2
        items[2].action = 2
        items[3].action = 2
        items[4].action = 2
        items[5].action = 2
        items[6].action = 2
        items[7].action = 2
        items[8].action = 2
        items[9].action = 2
        items[10].action = 2
        items[11].action = 2
        items[12].action = 2
        items[3].dateSaved = Date.yesterday
        items[7].dateSaved = Date.yesterday
        items[7].name = "bajunamehistory"
        items[7].processed = 2
        items[5].dateSaved = Date.yesterday
        items[9].dateSaved = Date.yesterday
        
        
        itemsNow = processedItem(arr: items, section: "now")
        if itemsNow.count > 1 {
            if itemsNow[0].count == 0 {
                itemsNow.remove(at: 0)
            }
        }
        
        itemsHistory = processedItem(arr: items, section: "history")
        if itemsHistory.count > 1 {
            if itemsHistory[0].count == 0 {
                itemsHistory.remove(at: 0)
            }
        }

        // Do any additional setup after loading the view.
        
        // collection view setup
        
        collectionViewItemDonate.delegate = self
        collectionViewItemDonate.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell",bundle: nil)
        self.collectionViewItemDonate.register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
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
        collectionViewItemDonate.reloadData()
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
    
    func processedItem(arr: [Baju],section: String) -> [[Baju]] {
        let sortedArr = arr.sorted(by: { (baju1: Baju, baju2: Baju) -> Bool in
            return baju1.dateSaved > baju2.dateSaved
        })
        var arrReturn1: [Baju] = []
        
        if (section == "now") {
            for item in sortedArr {
                if (item.processed == 1) {
                    arrReturn1.append(item)
                }
            }
        } else if (section == "history") {
            for item in sortedArr {
                if (item.processed == 2) {
                    arrReturn1.append(item)
                }
            }
        }
        
        var arrReturn = [[Baju]]()
        var tempDate: String = ""
        var tempArr = [Baju]()
        
        for item in arrReturn1 {
            if (item.dateSaved.toString(dateFormat: "dd-MM-yyyy") == tempDate) {
                tempArr.append(item)
            } else {
                tempDate = item.dateSaved.toString(dateFormat: "dd-MM-yyyy")
                arrReturn.append(tempArr)
                tempArr = []
                tempArr.append(item)
            }
        }
        
        if tempArr.count != 0 {
            arrReturn.append(tempArr)
        }
        
        return arrReturn
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


extension ItemDonateViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        var numberOfSection: Int = 0
        if nowHistory {
            numberOfSection = itemsNow.count
        } else {
            numberOfSection = itemsHistory.count
        }
        return numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionViewItemDonate.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemKeptCollectionReusableView", for: indexPath) as? ItemKeptCollectionReusableView{
            
            if nowHistory {
                sectionHeader.headerLabelItemKeptCollectionReusableView.text = currentTime(time: itemsNow[indexPath.section][0].dateSaved)
            } else {
                sectionHeader.headerLabelItemKeptCollectionReusableView.text = currentTime(time:  itemsHistory[indexPath.section][0].dateSaved)
            }
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numItemsInSection: Int = 0
        
        if nowHistory {
            numItemsInSection = itemsNow[section].count
        } else {
            numItemsInSection = itemsHistory[section].count
        }
        
        return numItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewItemDonate.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        print("\(itemsNow[indexPath.section]) : \(indexPath.section) - \(indexPath.row)")
        
        var selectedItem = itemsNow[indexPath.section][indexPath.row]
        
        if nowHistory {
            selectedItem = itemsNow[indexPath.section][indexPath.row]
        } else {
            selectedItem = itemsHistory[indexPath.section][indexPath.row]
        }
        
        cell.name.text = selectedItem.name
        cell.image.image = UIImage(named: "makeAChange")
        
        cell.layer.cornerRadius = 20.0

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ItemSoldDetailViewController") as? ItemDonateDetailViewController

        if nowHistory {
            vc?.itemContainer = itemsNow[indexPath.section][indexPath.row]
        } else {
            vc?.itemContainer = itemsHistory[indexPath.section][indexPath.row]
        }
        
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
