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

extension UserListViewController {
    
    func getUsers() {

        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String : AnyObject] {
                debugPrint(value)
                if let users = value["users"] as? [String: AnyObject] {
                    self.usersDateBase = users
                    
                 
 
                    DispatchQueue.main.async {
                        for (user, item) in self.usersDateBase ?? [:] {
                                             let userBase = User(fromDict: item as! [String : AnyObject])
                                             self.users.append(userBase)
                                         }
                        self.tableView.reloadData()
                    }
                    
                } else {
                    debugPrint("error one no users")
                }
            } else {
                debugPrint("no value")
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
