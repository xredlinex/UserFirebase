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
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    var userDateBse: [String : Any] = [:]
    
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
        
    }
    

   
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didTapAddNewUserActionButton(_ sender: Any) {
        debugPrint("tap")
        addNewsUser()
    }
    
}

extension NewUserViewController {
    
    func addNewsUser() {
        
        let name = userNameTextField.text
        let surname = userSurnameTextField.text
        let age = userAgeTextField.text
        let city = userCityTextField.text
        
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//                 rename students to users
            if let value = snapshot.value as? [String: Any] {
                if let students = value["users"] as? [String: Any] {
                    debugPrint("-----------")
                    debugPrint(value)
                    debugPrint("-----------")
                    self.userDateBse = students
                    debugPrint(self.userDateBse.count)
                    
                    let newStudent = ["name": name,
                                      "surname": surname,
                                      "age": age,
                                      "city": city]
                    
                    
                    DispatchQueue.main.async {
//                        let userId = "\(self.userDateBse.count + 1)"
                        debugPrint("zzzzzz")
//                        debugPrint(userId)
                        debugPrint(self.userDateBse.count)
                        debugPrint("zzzzzz")
                        
                        let random = Int.random(in: 1...1000)
                        let id: String = "ID" + "\(random)" + "-" + "\(self.userDateBse.count)"
//                        let id = "\(userDateBse.count)"
                        
                        self.userDateBse[id] = newStudent
                        
//                        self.userDateBse[userId] = newStudent
                        self.ref.child("users").setValue(self.userDateBse)
                    }
                    
                    
                    debugPrint("add news user succcsessssssss")
                    //                        make alert reigstration succses
                    //                        make transfer to list
                } else {
                    debugPrint("no values users")
                }
            } else {
                debugPrint("no string any")
            }
                   
                 }) { (error) in
                   print(error.localizedDescription)
               }
        
        
    }
    
}
