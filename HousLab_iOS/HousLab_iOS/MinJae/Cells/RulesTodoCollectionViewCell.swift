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
    
    private let ruleLabel1 = RulesTodosView()
    
    private let ruleLabel2 = RulesTodosView()
    
    private let ruleLabel3 = RulesTodosView()
    
    private let ruleLabel4 = RulesTodosView()
    
    private let ruleLabel5 = RulesTodosView()
    
    private lazy var ruleLabelStackView = UIStackView(arrangedSubviews: [ruleLabel1, ruleLabel2, ruleLabel3, ruleLabel4, ruleLabel5]).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    private let ruleBackground = UIView()
    
    private lazy var ruleStackView = UIStackView(arrangedSubviews: [ruleTitleLabel, ruleLabelStackView]).then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private let todoTitleLabel = UILabel().then {
        $0.text = "To-Do"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private let todoLabel1 = RulesTodosView()
    
    private let todoLabel2 = RulesTodosView()
    
    private let todoLabel3 = RulesTodosView()
    
    private let todoLabel4 = RulesTodosView()
    
    private let todoLabel5 = RulesTodosView()
    
    private let todoBackground = UIView()
    
    private lazy var todoLabelStackView = UIStackView(arrangedSubviews: [todoLabel1, todoLabel2, todoLabel3, todoLabel4, todoLabel5]).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    private lazy var todoStackView = UIStackView(arrangedSubviews: [todoTitleLabel, todoLabelStackView]).then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private lazy var totalStackView = UIStackView(arrangedSubviews: [ruleStackView, todoStackView]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([ruleTitleLabel,ruleBackground, todoTitleLabel, todoBackground])
        ruleBackground.addSubview(ruleLabelStackView)
        todoBackground.addSubview(todoLabelStackView)
        
        ruleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        
        ruleBackground.snp.makeConstraints { make in
            make.top.equalTo(ruleTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(ruleTitleLabel.snp.leading)
            make.bottom.equalToSuperview()
            make.width.equalTo(156)
        }
        
        ruleLabelStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        todoTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ruleTitleLabel)
            make.leading.equalTo(ruleBackground.snp.trailing).offset(15)
        }
        
        todoBackground.snp.makeConstraints { make in
            make.top.equalTo(todoTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(todoTitleLabel.snp.leading)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
            make.width.equalTo(156)
        }
        
        todoLabelStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    private func configUI() {
        ruleBackground.backgroundColor = UIColor(hex: "EFF5FF")
        todoBackground.backgroundColor = UIColor(hex: "EFF5FF")
        
        ruleBackground.layer.cornerRadius = 16
        todoBackground.layer.cornerRadius = 16
    }
    
    func setRulesData(_ data: [RulesDataModel]) {
        
        let labelList = [ruleLabel1, ruleLabel2, ruleLabel3, ruleLabel4, ruleLabel5]
        
        var index = 0
        labelList.forEach {
            $0.checkButton.isHidden = true
            $0.setRulesLabelData(rule: data[index].ruleString)
            
            index += 1
        }
        
    }
    
    func setTodosData(_ data: [TodoDataModel]) {
        
        let labelList = [todoLabel1, todoLabel2, todoLabel3, todoLabel4, todoLabel5]
        
        var index = 0
        labelList.forEach {
            $0.circleImageView.isHidden = true
            $0.setRulesLabelData(rule: data[index].todoString)
            
            index += 1
        }
        
    }
    
    
}
