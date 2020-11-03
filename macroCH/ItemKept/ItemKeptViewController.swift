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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "System", size: 21)!]
        self.navigationController?.title = "Kept"
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionViewItemKept.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemKeptCollectionReusableView", for: indexPath) as? ItemKeptCollectionReusableView{
            
            sectionHeader.headerLabelItemKeptCollectionReusableView.text = "Section \(indexPath.section)"
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let size = CGSize(width: 354, height: 50)
        
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemKept.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewItemKept.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        let selectedItem = itemKept[indexPath.section]
        
        cell.name.text = selectedItem.name
        cell.image.image = UIImage(named: "makeAChange")
        
        cell.layer.cornerRadius = 20.0
        
        return cell
    }
}
