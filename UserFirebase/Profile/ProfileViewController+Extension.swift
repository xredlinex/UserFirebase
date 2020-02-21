//
//  ProfileViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

extension ProfileViewController {
    
    func transformData() {
        
        if let name = user?.name {
            userValues.append(UserValues(userValueKey: "name", userValueValue: name))
        }
        if let surname = user?.surname {
            userValues.append(UserValues(userValueKey: "surname", userValueValue: surname))
        }
        if let age = user?.age {
            userValues.append(UserValues(userValueKey: "age", userValueValue: age))
        }
        if let city = user?.city {
            userValues.append(UserValues(userValueKey: "city", userValueValue: city))
        }
        if let properties = user?.optionalValues {
            for (key, value) in properties {
                userOptionalValues.append(UserValues(userValueKey: key, userValueValue: value))
            }
        }
    }
}

