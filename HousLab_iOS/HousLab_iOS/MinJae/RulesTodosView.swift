//
//  RulesView.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/05.
//

import UIKit

class RulesTodosView: UIView {
    
    let circleImageView = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .blue
    }
    
    let checkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        $0.tintColor = UIColor(hex: "5E9EFF")
    }
    
    private let ruleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [circleImageView, checkButton, ruleLabel]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([stackView])
        circleImageView.snp.makeConstraints {
            $0.height.width.equalTo(8)
        }
        
        checkButton.snp.makeConstraints {
            $0.height.width.equalTo(14)
        }
        
        ruleLabel.snp.makeConstraints {
            $0.leading.equalTo(circleImageView.snp.trailing).offset(8)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setRulesLabelData(rule: String) {
        ruleLabel.text = rule
    }
}
