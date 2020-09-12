//
//  RegularIncomeViewController.swift
//  donationVK
//
//  Created by Alexey on 11.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class RegularIncomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var data: [[String: String]] = []
    var typeCollection: TypeCollection?
    var imagePicker = UIImagePickerController()
    var header : String?{
        didSet{
            title = self.header
            
        }
    }
    @IBAction func pressButtonLoadPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func pressCalcleButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: { [unowned self] in
            self.imageView.frame.origin.y -= 500
            self.cancleButton.frame.origin.y -= 500
            
            }, completion: { _ in
                self.imageView.isHidden = true
                self.cancleButton.isHidden = true
                self.view.bringSubviewToFront(self.uploadView)
                UIView.animate(withDuration: 0.1, animations: {
                    self.uploadView.isHidden = false
                })
        })
        
 
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
       
        self.uploadView.isHidden = true
        self.imageView.image = image
        self.imageView.isHidden = false
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.cornerRadius = 10
        self.cancleButton.isHidden = false
        self.view.bringSubviewToFront(cancleButton)
    
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
        
        })
        self.imageView.isHidden = false
        self.imageView.image = image
        self.uploadView.isHidden = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    var textfieldSection: Int = 0
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < textfieldSection{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextFieldTableViewCell
            
            cell.content = data[indexPath.section]["placeholder"]
            cell.footer = data[indexPath.section]["footer"]
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell") as! SelectTableViewCell
            cell.content = data[indexPath.section]["placeholder"]
            cell.footer = data[indexPath.section]["footer"]
            return cell
        }
        
    }
    


    @IBAction func pressNextButton(_ sender: UIButton) {
        switch typeCollection {
        case .regular:
            let vc = storyboard?.instantiateViewController(withIdentifier: "byRegularViewController") as! ByRegularWayViewController
            vc.image = self.imageView.image
            navigationController?.pushViewController(vc, animated: true)
            break
        case .notRegular:
            let vc = storyboard?.instantiateViewController(withIdentifier: "extensionViewController") as! ExtensionViewController
            navigationController?.pushViewController(vc, animated: true)
            
            break
        case .none:
            break
        }
        
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var uploadView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .none
        myTableView.allowsSelection = false
        nextButton.backgroundColor = #colorLiteral(red: 0.2863293588, green: 0.523583889, blue: 0.8017535806, alpha: 1)
        nextButton.layer.cornerRadius = 10
        var yourViewBorder = CAShapeLayer()
        yourViewBorder.masksToBounds = true
        
        yourViewBorder.cornerRadius = 10
        yourViewBorder.strokeColor = #colorLiteral(red: 0.2625587285, green: 0.5495646, blue: 0.8816798925, alpha: 1)
        yourViewBorder.lineDashPattern = [10, 10]
        yourViewBorder.frame = uploadView.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: uploadView.bounds).cgPath
        uploadView.layer.addSublayer(yourViewBorder)
        imageView.isHidden = true
        cancleButton.isHidden = true
        myTableView.reloadData()
    }

}
