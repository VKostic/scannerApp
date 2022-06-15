//
//  BuyersCell.swift
//  scannerApp
//
//  Created by Vladica Kostic on 12.6.22..
//

import UIKit

class BuyersCell: UITableViewCell {
    
    @IBOutlet weak var buyersView: UIView!
    @IBOutlet weak var buyersNameLabel: UILabel!
    @IBOutlet weak var buyersSubtitle: UILabel!
    @IBOutlet weak var buyersImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
