//
//  DisposedViewController.swift
//  macroCH
//
//  Created by Gilbert Gozalie on 11/5/20.
//

import UIKit

class DisposedViewController: UIViewController {

    @IBOutlet weak var collectionViewDisposed: UICollectionView!
    var dateKept: [String] = ["Today", "Yesterday"]
    
    var disposed: [Baju] = [
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
        
//        collectionViewItemKept.delegate = self
//        collectionViewItemKept.dataSource = self
//
//        let nib = UINib(nibName: "ItemCollectionViewCell",bundle: nil)
//        self.collectionViewItemKept.register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        //navigation bar set up
        itemKeptNavBarSetUp()
    }
    
    func itemKeptNavBarSetUp() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "System", size: 21)!]
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


extension DisposedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionViewDisposed.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DisposedCollectionReusableView", for: indexPath) as? DisposedCollectionReusableView{

            sectionHeader.headerLabelDisposedCollectionReusableView.text = "Section \(indexPath.section)"

            return sectionHeader
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return disposed.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewDisposed.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell

        let selectedItem = disposed[indexPath.section]

        cell.name.text = selectedItem.name
        cell.image.image = UIImage(named: "exampleImage")



        cell.layer.cornerRadius = 20.0

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DisposedDetailViewController") as? DisposedDetailViewController
        vc?.itemContainer = disposed[indexPath.section]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
