//
//  NewUserViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewUserViewController: UIViewController {
    
    @IBOutlet weak var addNewUserButtonView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSurnameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    let validation = Validation()
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    var userDateBase: [String : Any] = [:]
    var newUser: [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSetupBackground()
        addNewUserButtonView.addSreenSetupButtons()
        
        userNameTextField.delegate = self
        userSurnameTextField.delegate = self
        userAgeTextField.delegate = self
        userCityTextField.delegate = self
        
        let keyboardWiilHide = UITapGestureRecognizer(target: self, action: #selector(keyboardHide))
        view.addGestureRecognizer(keyboardWiilHide)
        addNextButtonNumberPad()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapAddNewUserActionButton(_ sender: Any) {
        makeNewUser()
    }
}
