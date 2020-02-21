//
//  ProfileTableViewCell.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userKeyRowView: UIView!
    @IBOutlet weak var keyTextLabel: UILabel!
    @IBOutlet weak var valueTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userKeyRowView.addCellSetUp()
    }
}

extension ProfileTableViewCell {
    
    func updateProfileCell(_ userValues: UserValues) {
        keyTextLabel.text = userValues.userValueKey
        valueTextLabel.text = "\(userValues.userValueValue ?? "-")"
    }
}




