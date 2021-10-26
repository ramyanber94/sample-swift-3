//
//  HistoryDetailsViewController.swift
//  Cash-Register
//
//  Created by user202286 on 10/25/21.
//

import UIKit

class HistoryDetailsViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    var name: String = ""
    var quantity: Int = 0
    var totalPrice: Int = 0
    var date: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = "Name: \(name)"
        lblTotalPrice.text = "Total Price: \(totalPrice)"
        lblQuantity.text = "Quantity: \(quantity)"
        lblDate.text = "Date: \(date!)"
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
