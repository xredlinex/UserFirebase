//
//  ChooseUserTableViewCell.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class ChooseUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userSurnameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userInfoView.addCellSetUp()
    }
}

extension ChooseUserTableViewCell {
    
    func updateUserDataCell(_ user: User) {
        
        userNameTextLabel.text = user.name ?? "-"
        userSurnameTextLabel.text = user.surname ?? "-"
    }
}
