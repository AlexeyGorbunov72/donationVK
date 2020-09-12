//
//  ByRegularWayViewController.swift
//  donationVK
//
//  Created by Alexey on 12.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class ByRegularWayViewController: UIViewController {

    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var supportButton: UIButton!
    var image: UIImage?
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        progressView.layer.cornerRadius = 1
        progressView.transform = transform
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        supportButton.layer.borderWidth = 1
        supportButton.layer.borderColor = #colorLiteral(red: 0.2625587285, green: 0.5495646, blue: 0.8816798925, alpha: 1)
        supportButton.layer.cornerRadius = 10
        outsideView.layer.borderWidth = 1
        outsideView.layer.borderColor = #colorLiteral(red: 0.4415394664, green: 0.4893115163, blue: 0.5475963354, alpha: 1)
        outsideView.layer.cornerRadius = 10
        imageView.image = image
        title = "Новости"
    }
    
}
