//
//  ViewController.swift
//  Cash-Register
//
//  Created by user202286 on 10/15/21.
//

import UIKit

class ViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var productTable: UITableView!
    
    var productManager : ProductManager = ProductManager()
    var buyNewProduct : BuyNewProduct = BuyNewProduct()
    var price : Int = 0
    var quantity : Int = 0
    var total : Int = 0
    var leftQuantity : Int = 0
    var currentQuantity : Int = 0
    var errorMsg : String = ""
    var productName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        productTable.reloadData()
    }
    
    @IBAction func btnReset(_ sender: Any) {
        reset()
    }
    @IBAction func btnsQuantity(_ sender: UIButton) {
        lblQuantity.text! += sender.currentTitle!
        quantity = Int(lblQuantity.text!)!
        total = price * quantity
        lblTotal.text = "\(total)"
        validateBtnsQuantity()
    }

    @IBAction func btnBuy(_ sender: UIButton) {
        leftQuantity = currentQuantity - quantity
        let date = Date()
        if Int(lblTotal.text!) != nil{
            let purchasedItems : PurchasedItem = PurchasedItem(n: productName, q: quantity, t: total, d: date)
            productManager.updateProductQuantity(newQuantity: leftQuantity, name: purchasedItems.name)
            buyNewProduct.buyNewProduct(newProduct: purchasedItems)
        }else{
            validateBtnBuy()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PurchasedItemsSegue" {
            let ManageVC = segue.destination as! ManageViewController
            ManageVC.purachasedItems = buyNewProduct.getBoughtProduct()
            ManageVC.products = productManager.getAllProducts()
        }
        
    }
    func validateBtnsQuantity() {
        if quantity > currentQuantity {
            errorMsg = "Please don't exceed the current value of quantity for each product"
            reset()
            showError()
        }
    }
    func validateBtnBuy(){
        if (lblTotal.text?.isEmpty) != nil {
            errorMsg = "Please select one of the products"
            reset()
            showError()
        }
    }
    
    func reset(){
        lblQuantity.text = ""
        lblName.text = ""
        lblTotal.text = ""
    }
    
    func showError(){
        let alertController = UIAlertController(title: "Alert", message: errorMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { [self]
            (action: UIAlertAction!) in
            reset()
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        cell.lblTblName.text = productManager.getAllProducts()[indexPath.row].name
        cell.lblTblQuantity.text = "\(productManager.getAllProducts()[indexPath.row].quantity)"
        cell.lblTblPrice.text = "\(productManager.getAllProducts()[indexPath.row].price)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        price = productManager.getAllProducts()[indexPath.row].price
        currentQuantity = productManager.getAllProducts()[indexPath.row].quantity
        productName = productManager.getAllProducts()[indexPath.row].name
        lblName.text = productName
    }
    
}

