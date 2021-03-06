//
//  CategoryCollectionViewCell.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit
import SnapKit
import Then

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    var categoryImageView = UIImageView().then {
        $0.image = ImageLiteral.eventCategory
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        
        self.contentView.addSubview(categoryImageView)
        
        categoryImageView.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.center.equalToSuperview()
        }
    }
    
    private func configure() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .hous_blue_bg
    }
}
