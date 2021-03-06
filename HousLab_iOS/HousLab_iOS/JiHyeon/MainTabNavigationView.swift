//
//  MainTabNavigationView.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit
import SnapKit
import Then

enum TabType: String {
    case main = "Hous-"
    case rules = "Hous- 규칙"
    case profile = "Hous- ME"
}

class MainTabNavigationView: UIView {
    
    //var tabType: TabType = .main
    private var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 25)
        $0.text = "Hous-"
    }
    
    convenience init(tabType: TabType) {
        self.init(frame: .zero)
        render()
        configure(tabType)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        
        self.addSubViews([titleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(1.5)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
    private func configure(_ tabType: TabType) {
        titleLabel.text = tabType.rawValue
    }
}
