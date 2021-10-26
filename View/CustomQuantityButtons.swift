//
//  CustomQuantityButtons.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import UIKit

class CustomQuantityButtons: UIButton {

    override init(frame: CGRect) {
           super.init(frame: frame)
       }
       
       required init?(coder: NSCoder) {
          // layer
           super.init(coder: coder)
          // layer.backgroundColor = UIColor.red.cgColor
           layer.borderWidth = 1
           layer.borderColor = UIColor.black.cgColor
           layer.cornerRadius = layer.frame.height / 2
           
           
       }

}
