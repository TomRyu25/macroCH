//
//  ItemKeptViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 02/11/20.
//

import UIKit

class ItemKeptViewController: UIViewController {
    
    @IBOutlet weak var collectionViewItemKept: UICollectionView!
    
    
    var dateKept: [String] = ["Today", "Yesterday"]
    
    var itemKept: [Baju] = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        itemsNow = processedItem(arr: itemKept, section: "now")
        if itemsNow.count > 1 {
            if itemsNow[0].count == 0 {
                itemsNow.remove(at: 0)
            }
        }
        
        // collection view setup
        
        collectionViewItemKept.delegate = self
        collectionViewItemKept.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell",bundle: nil)
        self.collectionViewItemKept.register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        //navigation bar set up
        itemKeptNavBarSetUp()
    }
    
    func itemKeptNavBarSetUp() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "System", size: 21)!]
        self.navigationController?.title = "Kept"
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


extension ItemKeptViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemsNow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionViewItemKept.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemKeptCollectionReusableView", for: indexPath) as? ItemKeptCollectionReusableView{
            
            sectionHeader.headerLabelItemKeptCollectionReusableView.text = currentTime(time: itemsNow[indexPath.section][0].dateSaved)
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsNow[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewItemKept.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        let selectedItem = itemsNow[indexPath.section][indexPath.row]
        
        cell.name.text = selectedItem.name
        cell.image.image = UIImage(named: "exampleImage")
        
        
        
        cell.layer.cornerRadius = 20.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ItemKeptDetailViewController") as? ItemKeptDetailViewController
        vc?.itemContainer = itemKept[indexPath.section]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
