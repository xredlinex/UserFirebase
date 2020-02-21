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
