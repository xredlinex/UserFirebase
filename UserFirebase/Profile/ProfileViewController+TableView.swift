//
//  ProfileViewController+TableView.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return userValues.count
        default:
            return userOptionalValues.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureTableViewCell", for: indexPath) as! PictureTableViewCell
            cell.updateUserPicture("blank")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.keyTextLabel.text = userValues[indexPath.row].userValueKey
            cell.valueTextLabel.text = userValues[indexPath.row].usetValueValue as? String
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.keyTextLabel.text = userOptionalValues[indexPath.row].userValueKey
            cell.valueTextLabel.text = userOptionalValues[indexPath.row].usetValueValue as? String
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


