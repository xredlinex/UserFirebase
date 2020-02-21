//
//  AddInfoViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase




class AddInfoViewController: UIViewController {

    
    @IBOutlet weak var addNewFieldButton: UIView!
    
    @IBOutlet weak var propertiesKeyTextField: UITextField!
    @IBOutlet weak var propertiesValueTextField: UITextField!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    var user: User?
    var userDateBase: [String : Any] = [:]
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSetupBackground(addBlur: true, 0)
        addNewFieldButton.customSetupView(effectStyle: .systemMaterialLight, radius: 12.0, alpha: 0.8)
//        addNewFieldButton.addSreenSetupButtons()
        

        let keyboardWiilHide = UITapGestureRecognizer(target: self, action: #selector(keyboardHide))
        view.addGestureRecognizer(keyboardWiilHide)
        propertiesKeyTextField.delegate = self
        propertiesValueTextField.delegate = self

    }
    
    @IBAction func didTapAddPictureLinkActionButton(_ sender: Any) {
        addUserPicture()
    }
    

    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapAddPropertiesActionButton(_ sender: Any) {
        addNewProperties()
        
    }
    
}


