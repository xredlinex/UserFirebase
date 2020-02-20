//
//  NewUserViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Toast_Swift

extension NewUserViewController {
    
    func updateDateBase(_ newUser: [String : Any]) {
        
        self.view.makeToastActivity(.center)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            if let value = snapshot.value as? [String : Any] {
                if let users = value["users"] as? [String : Any] {
                    self.userDateBase = users
                    if let id = newUser["userId"] {
                        self.userDateBase["\(id)"] = newUser
                    }
                    self.ref.child("users").setValue(self.userDateBase)
                    self.view.hideToastActivity()
                    self.registrationAlert()
                } else {
                    self.presentErrorAlert("Data Base Error, Sorry")
                }
            } else {
                self.presentErrorAlert("Data Base Error, no such value")
            }
        }
    }
}

extension NewUserViewController {
    
    func makeNewUser() -> [String : Any] {
        
        var newUser: [String : Any] = [:]
        
        guard let name = userNameTextField.text, let surname = userSurnameTextField.text, let age = userAgeTextField.text, let city = userCityTextField.text else {
            presentErrorAlert("error")
            return [:]
        }
        
        let isvalidateName = validation.validateString(name)
        let isvalidateSurname = validation.validateString(surname)
        let isvalidateAge = validation.validateAge(Int(age) ?? 0)
        let isvalidateCity = validation.validateString(city)
        
        if isvalidateName && isvalidateSurname && isvalidateAge && isvalidateCity {
            
            let random = Int.random(in: 1...1001)
            let id: String = "ID" + "\(random)" + "-" + "\(self.userDateBase.count)"
            
            newUser = ["userId" : id,
                       "name" : name,
                       "surname": surname,
                       "age" : age,
                       "city": city]
            
        } else {
            var validateText = ""
            
            if !isvalidateName {
                validateText = validateText + ", Check Name Field"
            }
            if !isvalidateSurname {
                 validateText = validateText + ", Check Surname Field"
            }
            if !isvalidateAge {
                 validateText = validateText + ", Wrong Age"
            }
            if !isvalidateCity {
                 validateText = validateText + ", Chek City Field"
            }
            presentErrorAlert("Validation Error" + "\(validateText)" + "!")
        }
        return newUser
    }
}

extension NewUserViewController {
    
    func registrationAlert() {
        
        let alertController = UIAlertController(title: "Succes!", message: "Registration Complete", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
            self.navigationController?.pushViewController(viewcontroller, animated: false)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
