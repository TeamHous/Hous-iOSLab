//
//  UIView+.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func setCircleRadius(frameWidth: CGFloat) {
        self.layer.cornerRadius = frameWidth/2
        self.layer.masksToBounds = true
    }
}
