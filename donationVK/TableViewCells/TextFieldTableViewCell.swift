//
//  TextFieldTableViewCell.swift
//  donationVK
//
//  Created by Alexey on 11.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell{
    var idCell: Int?
    @IBOutlet weak var footerLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    var content: String? {
        didSet{
            textField.placeholder = self.content
        }
    }
    var footer: String?{
        didSet{
            footerLabel.text = self.footer
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
