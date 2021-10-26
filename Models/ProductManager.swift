//
//  ProductManager.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import Foundation

class ProductManager{
    var products = [Product]()
    
    init() {
        products.append(Product(n: "Pants",p: 50, q: 20))
        products.append(Product(n: "Shoes",p: 100, q: 50))
        products.append(Product(n: "Hats",p: 80, q: 10))
        products.append(Product(n: "Tishirts",p: 60 , q: 10))
        products.append(Product(n: "Dresses",p: 20, q: 24))
    }
       
    func getAllProducts()->[Product]{
           return products
       }
    func updateProductQuantity(newQuantity: Int , name: String){
        for product in products{
            if product.name == name{
                product.quantity = newQuantity
            }
        }
    }
}
