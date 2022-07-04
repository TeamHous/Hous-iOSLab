//
//  Date+Extension.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/04.
//

import Foundation

extension Date {
    func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)

        return formatter.string(from: self)
    }
}
