//
//  NewUserViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    
    @IBOutlet weak var addNewUserButtonView: UIView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userSurnameTextField: UITextField!
    
    @IBOutlet weak var userAgeTextField: UITextField!
    
    @IBOutlet weak var userCityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSetupBackground()
        addNewUserButtonView.addSreenSetupButtons()
    }
    

   
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapAddNewUserActionButton(_ sender: Any) {
    }
    
}
