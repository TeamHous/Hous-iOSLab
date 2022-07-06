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
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
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
    
    private lazy var todoLabelStackView = UIStackView(arrangedSubviews: [todoLabel1, todoLabel2, todoLabel3, todoLabel4, todoLabel5]).then {
        $0.axis = .vertical
        $0.alignment = .center
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(totalStackView)
        totalStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
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
