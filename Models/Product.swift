//
//  Product.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import Foundation

class Product{
    let name : String
    let price : Int
    var quantity : Int = 0
    var now = Date()
    
    init(n: String , p: Int , q: Int) {
        name = n
        quantity = q
        price = p
    }
 
}
