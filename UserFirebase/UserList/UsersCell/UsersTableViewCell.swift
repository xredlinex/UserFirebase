//
//  UsersTableViewCell.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userContentView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var containerImageView: UIView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userSurnameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUiForCell()
    }
}

extension UsersTableViewCell {
    
    func updateUserData(_ user: User) {
        
        userNameTextLabel.text = user.name ?? "-"
        userSurnameTextLabel.text = user.surname ?? "-"
        
        if let url = URL(string: user.picture ?? "-") {
            userImageView.kf.setImage(with: url)
        } else {
            userImageView.image = UIImage(named: "blank")
        }
    }
}

extension UsersTableViewCell {
    
    func setupUiForCell() {
        
        userContentView.customSetupView(effectStyle: .systemUltraThinMaterialDark, radius: 12.0, alpha: 0.8)
//        userContentView.addCellSetUp()
        userImageView.image = UIImage(named: "blank")
        containerImageView.clipsToBounds = true
        containerImageView.layer.cornerRadius = containerImageView.frame.width / 2
        containerImageView.layer.borderColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
        containerImageView.layer.borderWidth = 3
    }
}
