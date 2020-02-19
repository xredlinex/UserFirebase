//
//  UserListViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class User {
    var name: String?
    var surname: String?
    var age: Int?
    var city: String?
    
    init(fromDict dict:[String : AnyObject]) {
        self.name = dict["name"] as? String
        self.surname = dict["surname"] as? String
        self.age = dict["age"] as? Int
        self.city = dict["city"] as? String
    }
}




class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    var usersDateBase: [String : Any] = [:]
    
    var users = [User]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        
        screenSetupBackground()
        
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
          navigationController?.popViewController(animated: false)
      }
}
