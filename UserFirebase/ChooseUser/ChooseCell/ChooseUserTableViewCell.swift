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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        userInfoView.addCellSetUp()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
