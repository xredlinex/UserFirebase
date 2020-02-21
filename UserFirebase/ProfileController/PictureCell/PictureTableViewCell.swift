//
//  PictureTableViewCell.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPictureView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupForCell()
    }
    
    func updateUserPicture(_ pictureString: String) {
         
        if let url = URL(string: pictureString) {
            userPictureImageView.kf.setImage(with: url)
        } else {
            userPictureImageView.image = UIImage(named: "blank")
        }
    }
}

extension PictureTableViewCell {
    
    func setupForCell() {
        
        userPictureImageView.clipsToBounds = true
        userPictureImageView.layer.cornerRadius = userPictureImageView.frame.width / 2
        userPictureImageView.setupForRoundLayer()
    }
}


