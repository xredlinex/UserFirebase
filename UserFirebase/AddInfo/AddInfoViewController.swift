//
//  AddInfoViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase


class AddInfoViewController: UIViewController {

    
    @IBOutlet weak var addNewFieldButton: UIView!
    
    @IBOutlet weak var propertyKeyTextField: UITextField!
    @IBOutlet weak var propertyValueTextField: UITextField!
    
    
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSetupBackground()
        addNewFieldButton.addSreenSetupButtons()
        
        

    }
    

    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
}
