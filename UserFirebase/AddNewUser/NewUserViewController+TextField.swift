//
//  NewUserViewController+TextField.swift
//  UserFirebase
//
//  Created by alexey sorochan on 19.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension NewUserViewController {
    
    @objc func keyboardHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}

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
    
    @objc func addNextButtonAgeField() {
        userCityTextField.becomeFirstResponder()
    }
    
    func addNextButtonNumberPad() {
        let nextToolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(addNextButtonAgeField))
        let item = [flexSpace, next]
        nextToolBar.barStyle = .default
        nextToolBar.backgroundColor = .red
        next.tintColor = .white
        nextToolBar.items = item
        nextToolBar.sizeToFit()
        userAgeTextField.inputAccessoryView = nextToolBar
    }
}
