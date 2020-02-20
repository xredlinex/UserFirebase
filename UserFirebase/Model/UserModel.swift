//
//  UserModel.swift
//  UserFirebase
//
//  Created by alexey sorochan on 19.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class User {
    var name: String?
    var surname: String?
    var age: String?
    var city: String?
    var optionalValues: [String : Any]?

    init(fromDict dict:[String : AnyObject]) {
        self.name = dict["name"] as? String
        self.surname = dict["surname"] as? String
        self.age = dict["age"] as? String
        self.city = dict["city"] as? String
        self.optionalValues = dict["optionalValues"] as? [String : Any]
    }
}

