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
    
    func addCellSetUp() {
          
          let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
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

extension UIView {
    
    func gradientRoundCellPic(_ roundview: UIView) {
        
        
        
        
        
        
    }
    
}

//extension CALayer {
//    
//    func roundLayer(_ view: UIView) {
//        
//        let firstColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
//           let secondColor = UIColor(red: 75/255, green: 102/255, blue: 124/255, alpha: 1).cgColor
//           let lineWidth: CGFloat = 2
//           let rect = view.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
//           let path = UIBezierPath(roundedRect: rect, cornerRadius: view.frame.size.height / 2)
//           let gradient = CAGradientLayer()
//           gradient.frame =  CGRect(origin: CGPoint.zero, size: view.frame.size)
//           gradient.colors = [firstColor, secondColor]
//           gradient.startPoint = CGPoint(x: 0, y: 0.5)
//           gradient.endPoint = CGPoint(x: 1, y: 0.5)
//           let shape = CAShapeLayer()
//           shape.lineWidth = lineWidth
//           shape.path = path.cgPath
//           shape.strokeColor = UIColor.black.cgColor
//           shape.fillColor = UIColor.clear.cgColor
//           gradient.mask = shape
//        
//    }
//    
//}


