//
//  ProfileViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation


//struct UserValues {
//    var userValueKey: String?
//    var usetValueValue: Any?
//}

extension ProfileViewController {
    
    func transformData() {
        
        if let properties = user?.optionalValues {
            for (key, value) in properties {
                userOptionalValues?.append(UserValues(userValueKey: key, usetValueValue: value))
            }
        }
    }
}
