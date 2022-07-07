//
//  RulesTodoCollectionViewCell.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/06.
//

import UIKit

class RulesTodoCollectionViewCell: UICollectionViewCell {
    
    private let ruleTitleLabel = UILabel().then {
        $0.text = "Rules"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private lazy var ruleLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    private let ruleBackground = UIView().then {
        $0.clipsToBounds = true
    }
    
    private let todoTitleLabel = UILabel().then {
        $0.text = "To-Do"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private let todoBackground = UIView().then {
        $0.clipsToBounds = true
    }
    
    private lazy var todoLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)

        layoutIfNeeded()

        let titleHeight = ruleTitleLabel.bounds.height
        let stackViewHeight = ruleLabelStackView.bounds.height > todoLabelStackView.bounds.height ? ruleLabelStackView.bounds.height : todoLabelStackView.bounds.height

        var frame = layoutAttributes.frame
        frame.size.height = ceil(stackViewHeight + titleHeight + 24)
//        print(frame.size.height)
        layoutAttributes.frame = frame

        return layoutAttributes
    }
    
    private func render() {
        contentView.addSubViews([ruleTitleLabel,ruleBackground, todoTitleLabel, todoBackground])
        ruleBackground.addSubview(ruleLabelStackView)
        todoBackground.addSubview(todoLabelStackView)
        
        ruleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        
        ruleBackground.snp.makeConstraints { make in
            make.top.equalTo(ruleTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(ruleTitleLabel.snp.leading)
//            make.bottom.equalToSuperview()
            make.width.equalTo(156)
        }
        
        ruleLabelStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        todoTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ruleTitleLabel)
            make.leading.equalTo(ruleBackground.snp.trailing).offset(15)
        }
        
        todoBackground.snp.makeConstraints { make in
            make.top.equalTo(todoTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(todoTitleLabel.snp.leading)
            make.trailing.equalToSuperview().inset(24)
            make.width.equalTo((UIScreen.main.bounds.width - 48 - 15) / 2)
        }
        
        todoLabelStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
    }
    
    private func configUI() {
        ruleBackground.backgroundColor = UIColor(hex: "EFF5FF")
        todoBackground.backgroundColor = UIColor(hex: "EFF5FF")
        
        ruleBackground.layer.cornerRadius = 16
        todoBackground.layer.cornerRadius = 16
    }
    
    func setRulesData(_ data: [RulesDataModel]) {
        
        data.forEach { item in
            let label = RulesTodosView()
            label.checkButton.isHidden = true
            label.setRulesLabelData(rule: item.ruleString)
            
            ruleLabelStackView.addArrangedSubview(label)
        }
    }
    
    func setTodosData(_ data: [TodoDataModel]) {
        
        data.forEach { item in
            let label = RulesTodosView()
            label.circleImageView.isHidden = true
            label.setRulesLabelData(rule: item.todoString)
            label.setCheckButton(item.isDone)
            
            todoLabelStackView.addArrangedSubview(label)
//            UITapGestureRecognizer
        }
    }
    
    
}
