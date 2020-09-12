//
//  ExtensionViewController.swift
//  donationVK
//
//  Created by Alexey on 12.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class ExtensionViewController: UIViewController {
    @IBOutlet weak var datePickerTralingConstraint: NSLayoutConstraint!
    @IBOutlet weak var datePickerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var getAllCashButton: UIButton!
    
    @IBOutlet weak var inDateButton: UIButton!
    
    
    @IBAction func pressGetAllCash(_ sender: UIButton) {
        toggleAllCash()
    }
    
    @IBAction func pressInDate(_ sender: UIButton) {
        toggleInDate()
    }
    var isAllCashOn = false
    var isInDateOn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Дополнительно"
        self.datePickerTralingConstraint.constant = self.view.bounds.width + 50
        self.datePickerLeadingConstraint.constant = -self.view.bounds.width - 50
        self.view.layoutIfNeeded()
        
    }
    private func toggleAllCash(){
            
        if !self.isAllCashOn {
            
            if self.isInDateOn{
                self.isInDateOn.toggle()
                self.inDateButton.setImage(UIImage(named: "switchOff.png"), for: .normal)
                self.datePickerTralingConstraint.constant = self.view.bounds.width + 50
                self.datePickerLeadingConstraint.constant = -self.view.bounds.width - 50
                UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
                
            }
            self.getAllCashButton.setImage(UIImage(named: "switchOn.png"), for: .normal)
            isAllCashOn.toggle()
        }
        
    
    }
    private func toggleInDate(){
        if !self.isInDateOn{
            if self.isAllCashOn{
                self.isAllCashOn.toggle()
                self.getAllCashButton.setImage(UIImage(named: "switchOff.png"), for: .normal)
            }
            self.view.bringSubviewToFront(dateView)
            self.datePickerLeadingConstraint.constant = 12
            self.datePickerTralingConstraint.constant = 12
            UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)

            self.inDateButton.setImage(UIImage(named: "switchOn.png"), for: .normal)
            isInDateOn.toggle()
        }
        
    }


    

}
