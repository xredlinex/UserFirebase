//
//  ViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 21.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import SwiftGifOrigin

extension UIViewController {
    
    func screenSetupBackground(addBlur: Bool,_ alpha: CGFloat) {

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundAlphaView = UIView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage.gif(name: "back")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundAlphaView.backgroundColor = UIColor(red: 28/255, green: 5/255, blue: 20/255, alpha: 1)
        backgroundAlphaView.alpha = alpha
        
        if addBlur {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(blurEffectView)
            self.view.sendSubviewToBack(blurEffectView)
        }
        view.addSubview(backgroundImage)
        view.addSubview(backgroundAlphaView)
        view.sendSubviewToBack(backgroundAlphaView)
        view.sendSubviewToBack(backgroundImage)
    }
}
