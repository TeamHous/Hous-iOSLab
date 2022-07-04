//
//  UIStackView+Extension.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/04.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
