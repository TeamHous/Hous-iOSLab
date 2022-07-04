//
//  UIButton+Extension.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/04.
//

import UIKit

extension UIButton {
    
    var contentSize: CGFloat {
        return intrinsicContentSize.width
    }
    
    var margin: CGFloat {
        return (frame.width - contentSize) / 2
    }
}
