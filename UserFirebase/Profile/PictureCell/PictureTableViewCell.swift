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
        
        let firstColor = UIColor(red: 75/255, green: 102/255, blue: 124/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
        let lineWidth: CGFloat = 5
        let rect = userPictureImageView.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: userPictureView.frame.size.width / 2)
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: userPictureImageView.frame.size)
        gradient.colors = [firstColor, secondColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        userPictureImageView.layer.addSublayer(gradient)
    }
}


