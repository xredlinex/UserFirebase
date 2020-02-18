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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUiForCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UsersTableViewCell {
    
    func setupUiForCell() {
        
        userContentView.addCellSetUp()
        userImageView.image = UIImage(named: "blank")
        containerImageView.clipsToBounds = true
        containerImageView.layer.cornerRadius = containerImageView.frame.width / 2
        containerImageView.layer.borderColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
        containerImageView.layer.borderWidth = 3
    }
    
    func updateUserData() {
        
        
        
        
        
    }
}