//
//  TablePhoneTableViewCell.swift
//  URLSessionProject
//
//  Created by WEMA on 16/01/2024.
//

import UIKit
import SDWebImage

class TablePhoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tablePhoneLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(with data: PhoneObj?) {
        tablePhoneLabel.text = data?.title ?? "Item name not found"
        priceLabel.text = "\(data?.price ?? 0)"
        if let imageURL = URL(string: data?.thumbnail ?? "None") {
            img.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }else {
            img.image = UIImage(named: "placeholder.png")
        }
        
    }
}
