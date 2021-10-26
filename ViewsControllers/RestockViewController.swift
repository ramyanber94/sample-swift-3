//
//  RestockViewController.swift
//  Cash-Register
//
//  Created by user202286 on 10/25/21.
//

import UIKit

class RestockViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var restockTable: UITableView!
    @IBOutlet weak var txtQuantity: UITextField!
    
    var updatedProducts : [Product]?
    var name : String = ""
    var newQuantity : Int = 0
    var currentQuantity : Int = 0
    var errMsg : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRestock(_ sender: Any) {
        validate()
        if Int(txtQuantity.text!) != nil && Int(txtQuantity.text!)! > 0{
            newQuantity = Int(txtQuantity.text!)! + currentQuantity
            updateQuantity()
        }
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func updateQuantity(){
        for product in updatedProducts!{
            if product.name == name{
                product.quantity = newQuantity
            }
        }
    }
    func validate(){
        if currentQuantity == 0{
            errMsg = "Please select one of the products"

            showError()
        }else if Int(txtQuantity.text!) == nil && currentQuantity > 0{
            errMsg = "Please enter the amount of the new quantity"
            showError()
        }
    }
    func showError(){
        let alertController = UIAlertController(title: "Alert", message: errMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { [self]
            (action: UIAlertAction!) in
            txtQuantity.text = ""
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatedProducts!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restockTable.dequeueReusableCell(withIdentifier: "restockCell", for: indexPath)
        cell.textLabel?.text = updatedProducts![indexPath.row].name
        cell.detailTextLabel?.text = "\(updatedProducts![indexPath.row].quantity)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = updatedProducts![indexPath.row].name
        currentQuantity = updatedProducts![indexPath.row].quantity
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
