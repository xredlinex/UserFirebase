//
//  PictureTableViewCell.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPictureView: UIView!
    @IBOutlet weak var userPictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupForCell()
    }
    
    func updateUserPicture(_ pictureName: String) {
        
        userPictureImageView.image = UIImage(named: pictureName)
    }

    
}

extension PictureTableViewCell {
    
    func setupForCell() {
        
        userPictureView.clipsToBounds = true
        userPictureView.layer.cornerRadius = userPictureImageView.frame.width / 2
        
userPictureImageView.clipsToBounds = true
      userPictureImageView.layer.cornerRadius = userPictureImageView.frame.width / 2
        
        
                   let firstColor = UIColor(red: 75/255, green: 102/255, blue: 124/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
                   let lineWidth: CGFloat = 5
                   let rect = userPictureView.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
                   let path = UIBezierPath(roundedRect: rect, cornerRadius: userPictureView.frame.size.width / 2)
                   let gradient = CAGradientLayer()
                   gradient.frame =  CGRect(origin: CGPoint.zero, size: userPictureView.frame.size)
                   gradient.colors = [firstColor, secondColor]
                   gradient.startPoint = CGPoint(x: 0, y: 0.5)
                   gradient.endPoint = CGPoint(x: 1, y: 0.5)
                   let shape = CAShapeLayer()
                   shape.lineWidth = lineWidth
                   shape.path = path.cgPath
                   shape.strokeColor = UIColor.black.cgColor
                   shape.fillColor = UIColor.clear.cgColor
                   gradient.mask = shape
        userPictureView.layer.addSublayer(gradient)
    }
}


