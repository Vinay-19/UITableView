//
//  CustomTableCell.swift
//  TableViewWithImages
//
//  Created by Vinay Kumar Thapa on 2022-12-02.
//

import UIKit

class CustomTableCell: UITableViewCell {

    
    @IBOutlet weak var empImage: UIImageView!
    
    @IBOutlet weak var empFullName: UILabel!
    
    @IBOutlet weak var empPhoneNum: UILabel!
    
    @IBOutlet weak var empEmailId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.empImage.layer.cornerRadius = 50
    }

    

}
