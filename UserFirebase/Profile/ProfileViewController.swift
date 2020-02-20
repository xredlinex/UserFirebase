//
//  ProfileViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

struct Objects {
    var objectKey: String?
    var objectValue: Any?
}



class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
  
    var user: User?
    var userProperties: [String : Any] = [:]
    var objectAtrray = [Objects]()
 
   var userValues = [Objects]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSetupBackground()
        
        if let properties = user?.optionalValues {
            userProperties = properties
        }
        
        if let name = user?.name {
            userValues.append(Objects(objectKey: "name", objectValue: name))
        }
        if let surname = user?.surname {
            userValues.append(Objects(objectKey: "surname", objectValue: surname))
        }
        if let age = user?.age {
            debugPrint(age)
            userValues.append(Objects(objectKey: "age", objectValue: age))
        }
        if let city = user?.city {
            userValues.append(Objects(objectKey: "city", objectValue: city))
        }
        

        
        for (key, value) in userProperties {
            debugPrint("\(key) -> \(value)")
            objectAtrray.append(Objects(objectKey: key, objectValue: value))
        }
        
        debugPrint(userValues.count)
        debugPrint(objectAtrray.count)

        
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButon(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}


