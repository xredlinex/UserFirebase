//
//  UserListViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Toast_Swift

extension UserListViewController {
    
    func getUsers() {
        
        self.view.makeToastActivity(ToastPosition.center)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String : Any] {
                debugPrint(value)
                if let users = value["users"] as? [String: Any] {
                    self.usersDateBase = users
                    DispatchQueue.main.async {
                        for (_ , item) in self.usersDateBase {
                            let userBase = User(fromDict: item as! [String : AnyObject])
                            self.users.append(userBase)
                        }
                        self.tableView.reloadData()
                        self.view.hideToastActivity()
                    }
                } else {
                    self.view.hideToastActivity()
                    self.presentErrorAlert("Sorry No Üsers Found:(")
                }
            } else {
                self.view.hideToastActivity()
                self.presentErrorAlert("Sorry No Data :(")
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

extension UserListViewController {
    
    func prepareUserBase() {
        
        
        
        
    }
    
}
