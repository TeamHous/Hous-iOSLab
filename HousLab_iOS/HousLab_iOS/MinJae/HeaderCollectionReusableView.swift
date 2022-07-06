//
//  CollectionReusableView.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/06.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    let subtitleLabel = UILabel().then {
        $0.text = "Coming up-"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setSubTitleLabel(data: String) {
        subtitleLabel.text = data
    }
    
}
