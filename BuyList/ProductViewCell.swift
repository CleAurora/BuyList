//
//  ProductViewCell.swift
//  BuyList
//
//  Created by Cleís Aurora Pereira on 04/11/20.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    func setup(product: Product){
        nameLabel.text = product.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
