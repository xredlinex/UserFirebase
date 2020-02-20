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
        
        if let newKey = propertiesValueTextField.text, newKey != "" {
            if let newValue = propertiesValueTextField.text, newValue != "" {
                
               
                
                self.view.makeToastActivity(.center)
                ref.observeSingleEvent(of: .value) { (snapshot) in
                    if let value = snapshot.value as? [String : Any] {
                        if let users = value["users"] as? [String : AnyObject] {
                            self.userDateBase = users
                            if let userId = self.user?.userId {
                                self.userProperties.append(UserValues(userValueKey: newKey, usetValueValue: newValue))
//                                userDateBase[userId]?["optionalValues"] = self.userProperties
//                                userDateBase[userId]["optionalValues"][newKey] = [newValue]
//                                userDateBase[userId].updateValue(userProperties, forKey: "optionalValues")
//                                if let updateUser = self.user {
//                                    let values = [newValue, newKey]
//
//                                    updateUser["optionalValues"] = values
//                                }
                                if let updateUser = self.userDateBase[userId] {
                                    let properties: [String : Any] = [newKey : newValue]
//                                    updateUser["optionalValues"] = properties
                                    debugPrint("->>>>>>>>>>")
                                    debugPrint(updateUser)
                                    debugPrint(properties)
                                    debugPrint("->>>>>>>>>>")
//                                    updateUser["optionalValue"] as? [String : Any] = properties
                                }
                                
                                
                                
                                
                                
//                                userDateBase[userId] = updateUser
                                
                                
                      
                                
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
