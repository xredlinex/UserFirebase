//
//  UserListViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    var usersDateBase: [String : Any] = [:]
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        screenSetupBackground(addBlur: false, 0.4)

        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectViewController") as! SelectViewController
        navigationController?.pushViewController(viewcontroller, animated: false)
    }
}
