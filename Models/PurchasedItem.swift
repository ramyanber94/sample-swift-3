//
//  PurchasedItem.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import Foundation

class PurchasedItem{
    let name : String
    let quantity : Int
    let totalPrice : Int
    let date : Date
    
    
    init(n: String , q: Int , t: Int , d: Date) {
        name = n
        quantity = q
        totalPrice = t
        date = d
    }
}
