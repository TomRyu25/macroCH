//
//  NewsDetailViewController.swift
//  macroCH
//
//  Created by Laurens Bryan Cahyana on 18/11/20.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsDetail: UITextView!
    
    @IBOutlet weak var newsContent: UILabel!
    
    @IBOutlet weak var newsImage2: UIImageView!
    
    @IBOutlet weak var newsAdditionalDetail: UITextView!
    
    
    var news:News = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func chevronBtn(_ sender: Any) {
    }
    @IBAction func originalArticleBtn(_ sender: Any) {
    }
    
    func goToURL() {
        
    }
}
