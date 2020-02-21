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
    
    func makeNewUser() {
        
        guard let name = userNameTextField.text,
              let surname = userSurnameTextField.text,
              let age = userAgeTextField.text,
              let city = userCityTextField.text
        else { return }
        
        let id: String = "ID" + "\(Int.random(in: 1...1001))" + "-" + "\(self.userDateBase.count)"
        let isvalidateName = validation.validateString(name)
        let isvalidateSurname = validation.validateString(surname)
        let isvalidateAge = validation.validateAge(Int(age) ?? 0)
        let isvalidateCity = validation.validateCity(city)
        
        if isvalidateName && isvalidateSurname && isvalidateAge && isvalidateCity {

            newUser = ["userId" : id,
                       "name" : name,
                       "surname": surname,
                       "age" : age,
                       "city": city]
            
            updateDateBase(newUser)
            
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
    }
}

extension ChooseUserViewController {
    func navigateToViewController (_ user: User) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddInfoViewController") as! AddInfoViewController
        viewController.user = user
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension NewUserViewController {
    
    func registrationAlert() {
        let alertController = UIAlertController(title: "Succes!", message: "Registration Complete", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
            self.navigationController?.pushViewController(viewController, animated: false)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
