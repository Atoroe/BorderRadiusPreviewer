//
//  UIView + Extension.swift
//  BorderRadiusPreviewer
//
//  Created by Artiom Poluyanovich on 20.04.21.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(radius: CGFloat? = 10) {
        guard let radius = radius else {
            return
        }
        self.layer.cornerRadius = radius
    }
    
    func dropShadow(shadowColor: UIColor? = .black) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor?.cgColor ?? UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addGradient(startPointColor: UIColor, endPointColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [startPointColor.cgColor, endPointColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.frame = self.bounds
        clipsToBounds = true
        layer.insertSublayer(gradient, at: 0)
    }
    
}

