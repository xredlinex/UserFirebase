//
//  AddInfoViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Toast_Swift

extension AddInfoViewController {
    
    func addNewProperties() {
        
        if let newKey = propertiesKeyTextField.text, newKey != "" {
            if let newValue = propertiesValueTextField.text, newValue != "" {
                self.view.makeToastActivity(.center)
                ref.observeSingleEvent(of: .value) { (snapshot) in
                    if let value = snapshot.value as? [String : Any] {
                        if let users = value["users"] as? [String : Any] {
                            self.userDateBase = users
                            if let id = self.user?.userId {
                                if var user = self.userDateBase[id] as? [String : Any] {
                                    if var optionalValue = user["optionalValues"] as? [String : Any] {
                                        optionalValue[newKey] = newValue
                                        user["optionalValues"] = optionalValue
                                    } else {
                                        user["optionalValues"] = [newKey : newValue]
                                    }
                                    self.userDateBase[id] = user
                                    self.ref.child("users").setValue(self.userDateBase)
                                    self.view.hideToastActivity()
                                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
                                    self.navigationController?.pushViewController(viewController, animated: false)
                                    
                                }
                            }
                        }
                    }
                }
            } else {
                presentErrorAlert("value is empty")
            }
        } else {
            presentErrorAlert("Key value is empty")
        }
    }
}




extension AddInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 310
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case propertiesKeyTextField:
            propertiesValueTextField.becomeFirstResponder()
        case propertiesValueTextField:
            bottomHeightConstraint.constant = 0
            propertiesValueTextField.resignFirstResponder()
        default:
            propertiesKeyTextField.becomeFirstResponder()
        }
        return true
    }
}

extension AddInfoViewController {
    
    @objc func keyboardHide() {
        bottomHeightConstraint.constant = 0
        self.view.endEditing(true)
    }
}
