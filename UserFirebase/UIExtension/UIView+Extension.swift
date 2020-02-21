//
//  UIView+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 21.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension UIView {
    
    func customSetupView(effectStyle: UIBlurEffect.Style, radius: CGFloat, alpha: CGFloat) {
        
        let blurEffect = UIBlurEffect(style: effectStyle)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = radius
        blurView.alpha = alpha
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
    }
}

extension UIView {
    
    func setupForRoundLayer() {
        
        let firstColor = UIColor(red: 75/255, green: 102/255, blue: 124/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
        let lineWidth: CGFloat = 5
        let rect = self.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: self.frame.size.width / 2)
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [firstColor, secondColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        self.layer.addSublayer(gradient)
        
    }
}
