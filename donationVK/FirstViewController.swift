//
//  FirstViewController.swift
//  donationVK
//
//  Created by Alexey on 11.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var createButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newSizeOfView = buttonView.sizeThatFits(CGSize(width: 1000.0, height: 1000.0))
        buttonView.frame.size.width = newSizeOfView.width
        buttonView.frame.size.height = newSizeOfView.height
        buttonView.layer.cornerRadius = 10
        buttonView.backgroundColor = #colorLiteral(red: 0.2863293588, green: 0.523583889, blue: 0.8017535806, alpha: 1)
        createButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
    

}
