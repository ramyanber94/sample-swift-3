//
//  ManageViewController.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import UIKit

class ManageViewController: UIViewController {

    var purachasedItems : [PurchasedItem]?
    var products : [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historyPurchasedItemsSegue"{
            let historyVC = segue.destination as! HistoryTableViewController
            historyVC.historyPurshacedItems = purachasedItems
        }else if segue.identifier == "RestockSegue"{
            let restockVC = segue.destination as! RestockViewController
            restockVC.updatedProducts = products
        }
    }
    
    @IBAction func btnHistory(_ sender: Any) {
        }


    @IBAction func btnRestock(_ sender: Any) {
        }
    

}
