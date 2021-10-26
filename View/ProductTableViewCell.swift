//
//  ProductTableViewCell.swift
//  Cash-Register
//
//  Created by user202286 on 10/22/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTblName: UILabel!
    @IBOutlet weak var lblTblPrice: UILabel!
    @IBOutlet weak var lblTblQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTblPrice.textColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
