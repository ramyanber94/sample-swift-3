//
//  HistoryItemDetailsManager.swift
//  Cash-Register
//
//  Created by user202286 on 10/25/21.
//

import Foundation

class HistoryItemDetailsManager {
    var historyItemDetails = [PurchasedItem]()
    
    func addNewItemDetails(newProduct: PurchasedItem){
        historyItemDetails.append(newProduct)
       }
       
       func getAllProducts()->[PurchasedItem]{
           return historyItemDetails
       }
}
