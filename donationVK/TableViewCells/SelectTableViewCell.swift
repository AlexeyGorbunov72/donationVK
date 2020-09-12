//
//  SelectTableViewCell.swift
//  donationVK
//
//  Created by Alexey on 11.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {
    var idCell: Int?
    private lazy var popUp = self.getPopUpView()
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var content: String? {
        didSet{
            contentLabel.text = self.content
        }
    }
    var footer: String?{
        didSet{
            footerLabel.text = self.footer
        }
    }
    var isArrowUp = false
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.addSubview(popUp)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPicker))
        self.addGestureRecognizer(tapGesture)
    }
    private func getPopUpView() -> UIView{
        let viewPopUp = UIView(frame: self.frame)
        viewPopUp.isHidden = true
        return viewPopUp
    }
    private func appearPopUp(){
        
    }
    @objc func showPicker(){
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseOut, animations: { [unowned self] in
            let angle = Double.pi
            
            self.arrow.transform = self.arrow.transform.rotated(by: CGFloat(angle))
            
            }, completion: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
