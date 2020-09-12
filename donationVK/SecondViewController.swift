//
//  SecondViewController.swift
//  donationVK
//
//  Created by Alexey on 11.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var regularView: UIView!
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        targetView.layer.cornerRadius = 10
        regularView.layer.cornerRadius = 10
        let regularTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnRegular(_ :)))
        let targetTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnTarget(_:)))
        regularView.addGestureRecognizer(regularTapGesture)
        targetView.addGestureRecognizer(targetTapGesture)
        
    
    }
    
    @objc func tapOnRegular(_ sender: UITapGestureRecognizer?){
        print("asdpjsajdpajdpo")
        let vc = storyboard?.instantiateViewController(identifier: "formController") as! RegularIncomeViewController
        vc.data = [["footer": "Название сбора",
         "placeholder": "Название сбора"],
        ["footer": "Сумма в месяц, ₽",
         "placeholder": "Сколько нужно в месяц?"],
        ["footer": "Цель", "placeholder": "Например, поддержка приюта"],
        ["footer": "Описание",
         "placeholder": "На что пойдут деньги и как они кому-то помогут?"],
        ["footer": "Куда получать деньги",
         "placeholder": "Счет VK Pay · 1234"],
        ["footer": "Автор",
         "placeholder": "Матвей Правосудов"]]
        vc.textfieldSection = 4
        vc.header = "Регулярный сбор"
        vc.typeCollection = .regular
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapOnTarget(_ sender: UITapGestureRecognizer?){
        let vc = storyboard?.instantiateViewController(identifier: "formController") as! RegularIncomeViewController
        vc.data = [["footer": "Название сбора",
         "placeholder": "Название сбора"],
        ["footer": "Сумма в месяц, ₽",
         "placeholder": "Сколько нужно собрать?"],
        ["footer": "Цель", "placeholder": "Например, лечение человека"],
        ["footer": "Описание",
         "placeholder": "На что пойдут деньги и как они кому-то помогут?"],
        ["footer": "Куда получать деньги",
         "placeholder": "Счет VK Pay · 1234"]]
        vc.textfieldSection = 4
        vc.header = "Целевой сбор"
        vc.typeCollection = .notRegular
        navigationController?.pushViewController(vc, animated: true)
    }
}
