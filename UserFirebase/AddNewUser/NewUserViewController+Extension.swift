//
//  NewUserViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit


extension NewUserViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 280
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            userSurnameTextField.becomeFirstResponder()
        case userSurnameTextField:
            userAgeTextField.becomeFirstResponder()
        case userAgeTextField:
            userCityTextField.becomeFirstResponder()
        case userCityTextField:
            bottomHeightConstraint.constant = 0
            userCityTextField.resignFirstResponder()
        default:
            userNameTextField.becomeFirstResponder()
        }
        return true
    }
    
    
    
}


extension NewUserViewController {
    
    @objc func keyboardHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
