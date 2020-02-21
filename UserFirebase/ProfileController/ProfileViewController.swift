//
//  ProfileViewController.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var user: User?
    var userValues = [UserValues]()
    var userOptionalValues = [UserValues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSetupBackground(addBlur: true, 0)
        transformData()
    
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


