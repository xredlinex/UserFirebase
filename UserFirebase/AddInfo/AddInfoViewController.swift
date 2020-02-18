//
//  AddInfoViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class AddInfoViewController: UIViewController {

    
    @IBOutlet weak var addNewFieldButton: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSetupBackground()
        addNewFieldButton.addSreenSetupButtons()

    }
    

    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
}
