//
//  ItemKeptDetailViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 04/11/20.
//

import UIKit

class ItemKeptDetailViewController: UIViewController {
    
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    
    
    @IBOutlet weak var notYetBtn: UIButton!
    
    var itemContainer: Baju = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTypeLabel.text = itemContainer.name
        dateLabel.text = itemContainer.dateSaved.toString(dateFormat: "dd/MM/yyyy")
        conditionLabel.text = condition(itemCondition: itemContainer.condition)
        actionLabel.text = action(act: itemContainer.action)
        
        //setup
        notYetBtn.layer.borderWidth = 1
        notYetBtn.layer.borderColor = #colorLiteral(red: 0.8338291645, green: 0.4399331808, blue: 0.3727329373, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    //navbar setup
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.black
        nav?.titleTextAttributes? = [NSAttributedString.Key.font: UIFont(name: "System", size: 21)!]
        nav?.backItem?.title = ""
        
    }
    
    func condition(itemCondition: Condition) -> String {
        if ((itemCondition.hole == false) && (itemCondition.wearable == false)) {
            return "Good Condition"
        } else {
            return "Bad Condition"
        }
    }
    
    func action(act: Int) -> String {
        if (act == 1){
            return "Kept"
        } else if (act == 2){
            return "Donated"
        } else if (act == 3){
            return "Sold"
        } else {
            return "Thrown"
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



extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
