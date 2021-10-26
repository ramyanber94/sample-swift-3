//
//  BuyNewProduct.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import Foundation

class BuyNewProduct{
    var productCart = [PurchasedItem]()
    
    func buyNewProduct(newProduct: PurchasedItem){
  
        productCart.append(newProduct)
    }
    
    func getBoughtProduct()->[PurchasedItem]{
        return productCart
    }
    
}
