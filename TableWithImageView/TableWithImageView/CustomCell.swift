//
//  CustomCell.swift
//  TableWithImageView
//
//  Created by Vinay Kumar Thapa on 2022-12-01.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView1.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
