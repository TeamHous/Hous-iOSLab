//
//  ImageLiteral.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit

enum ImageLiteral {
    
    static var todayTodo: UIImage { .load(named: "todayTodo")}
    static var myTodoCheck: UIImage { .load(named: "myTodoCheck")}
    static var eventCategory: UIImage { .load(named: "eventCategory")}
    static var todayTodoManager: UIImage { .load(named: "todayTodoManager")}
    static var doneCheckBox: UIImage { .load(named: "doneCheckBox")}
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
}
