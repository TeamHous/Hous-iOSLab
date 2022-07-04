//
//  NSObject+Extension.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/04.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
