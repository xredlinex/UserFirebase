//
//  SelectViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    
    @IBOutlet weak var userListView: UIView!
    @IBOutlet weak var newUserView: UIView!
    @IBOutlet weak var addInfoView: UIView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
        
        
    }
    
    @IBAction func didTapShowUserListActionButtom(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        navigationController?.pushViewController(viewController, animated: false)
        
    }
    
    @IBAction func didTapAddNewUserActionButtom(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewUserViewController") as! NewUserViewController
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    @IBAction func didTapAddNewInfoActionButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddInfoViewController") as! AddInfoViewController
        navigationController?.pushViewController(viewController, animated: false)
    }
}


extension SelectViewController {
    
    func uiSetup() {
        
        mainScreenSetupBackground("https://media.giphy.com/media/SpoZWVAYlMCMGcLfqU/giphy.gif")
        userListView.mainSreenSetupButtons()
        newUserView.mainSreenSetupButtons()
        addInfoView.mainSreenSetupButtons()
        
    }
}
