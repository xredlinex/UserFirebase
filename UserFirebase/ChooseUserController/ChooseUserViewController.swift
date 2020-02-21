//
//  ChooseUserViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChooseUserViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://userfirebase-3f732.firebaseio.com/")
    var usersDateBase: [String : Any] = [:]
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSetupBackground(addBlur: true, 0)
        getUsers()
        
        tableView.register(UINib(nibName: "ChooseUserTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseUserTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}
