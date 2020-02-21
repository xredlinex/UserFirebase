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
                                    self.navigateToListController()
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

extension AddInfoViewController {
    
    func addUserPicture() {
        
        let alertController = UIAlertController(title: "Add Link To Picture", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let addPictureAction = UIAlertAction(title: "Set Picture", style: .default) { (_) in
            let textfield = alertController.textFields! [0]
            let pictureLink = textfield.text
            self.view.makeToastActivity(.center)
            self.ref.observeSingleEvent(of: .value) { (snapshot) in
                if let value = snapshot.value as? [String : Any] {
                    if let users = value["users"] as? [String : Any] {
                        self.userDateBase = users
                        if let id = self.user?.userId {
                            if var user = self.userDateBase[id] as? [String : Any] {
                                user["picture"] = pictureLink
                                self.userDateBase[id] = user
                                self.ref.child("users").setValue(self.userDateBase)
                                self.view.hideToastActivity()
                                self.view.makeToast("Picture Link Added")
                                self.navigateToListController()
                            }
                        }
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(cancelAction)
        alertController.addAction(addPictureAction)
        present(alertController, animated: true)
    }
}


extension AddInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottomHeightConstraint.constant = 220
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case propertiesKeyTextField:
            propertiesValueTextField.becomeFirstResponder()
        case propertiesValueTextField:
            propertiesValueTextField.resignFirstResponder()
            bottomHeightConstraint.constant = 0
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

extension AddInfoViewController {
    
    func navigateToListController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}

extension AddInfoViewController {
    
    func presentErrorAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
