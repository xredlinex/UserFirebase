//
//  Class+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIViewController {
    
    func mainScreenSetupBackground(_ backgroundImageLink: String) {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundAlphaView = UIView(frame: UIScreen.main.bounds)
        let imgURL = URL(string: backgroundImageLink)
        backgroundImage.kf.setImage(with: imgURL)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundAlphaView.backgroundColor = UIColor(red: 28/255, green: 5/255, blue: 20/255, alpha: 1)
        backgroundAlphaView.alpha = 0.4
        view.addSubview(backgroundImage)
        view.addSubview(backgroundAlphaView)
        view.sendSubviewToBack(backgroundAlphaView)
        view.sendSubviewToBack(backgroundImage)
    }
    
    func screenSetupBackground() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let imgURL = URL(string: "https://media.giphy.com/media/SpoZWVAYlMCMGcLfqU/giphy.gif")
        backgroundImage.kf.setImage(with: imgURL)
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(blurEffectView)
        self.view.sendSubviewToBack(backgroundImage)
    }
}

extension UIView {
    
    func mainSreenSetupButtons() {
        
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        blurView.alpha = 0.8
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                    blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
        
    }
    
    func addSreenSetupButtons() {
        
        let blurEffect = UIBlurEffect(style: .systemMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blurView, at: 0)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12.0
        blurView.alpha = 0.8
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                    blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
        
    }
    
    
    
    
    
}

extension UIViewController {
    
 
}
