//
//  HomeViewController.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/04.
//

import UIKit
import SnapKit
import Then


class HomeViewController: UIViewController {
    
    enum Size {
        static let screenWidth = UIScreen.main.bounds.width
        static let addEventCellSize = CGSize(width: 72, height: 88)
        static let eventCellSize = CGSize(width: 88, height: 88)
    }
    
    //MARK: Properties
    private var rules: [RulesDataModel]?
    private var todos: [TodoDataModel]?
    
    //MARK: UI Compononents
    private let titleLabel = UILabel().then {
        $0.text = "Hous-"
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private let comingUpLabel = UILabel().then {
        $0.text = "Coming up-"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private var incomingEventsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var eventStackView = UIStackView(arrangedSubviews: [comingUpLabel, incomingEventsCollectionView]).then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.distribution = .fillProportionally
    }
    
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
    
    private lazy var ruleStackView = UIStackView(arrangedSubviews: [ruleLabel1, ruleLabel2, ruleLabel3, ruleLabel4, ruleLabel5]).then {
        ruleLabel1.checkButton.isHidden = true
        ruleLabel2.checkButton.isHidden = true
        ruleLabel3.checkButton.isHidden = true
        ruleLabel4.checkButton.isHidden = true
        ruleLabel5.checkButton.isHidden = true
        
        $0.axis = .vertical
        $0.spacing = 8
        $0.backgroundColor = UIColor(hex: "EFF5FF")
    }
    
    private lazy var ruleTotalStackView = UIStackView(arrangedSubviews: [ruleTitleLabel, ruleStackView]).then {
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
    
    private lazy var todosStackView = UIStackView(arrangedSubviews: [todoLabel1, todoLabel2, todoLabel3, todoLabel4, todoLabel5]).then {
        todoLabel1.circleImageView.isHidden = true
        todoLabel2.circleImageView.isHidden = true
        todoLabel3.circleImageView.isHidden = true
        todoLabel4.circleImageView.isHidden = true
        todoLabel5.circleImageView.isHidden = true
        
        $0.axis = .vertical
        $0.spacing = 8
        $0.backgroundColor = UIColor(hex: "EFF5FF")
    }
    
    private lazy var todosTotalStackView = UIStackView(arrangedSubviews: [todoTitleLabel, todosStackView]).then {
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private lazy var rulesTodoStackView = UIStackView(arrangedSubviews: [ruleTotalStackView,todosTotalStackView]).then {
        $0.axis = .horizontal
        $0.spacing = 15
        $0.distribution = .fillEqually
    }
    
    private let homeProfileLabel = UILabel().then {
        $0.text = "Home Profile-"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private let profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.collectionViewLayout = layout
        $0.showsVerticalScrollIndicator = false
    }
    
    private lazy var profileStackView = UIStackView(arrangedSubviews: [homeProfileLabel, profileCollectionView]).then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.distribution = .fillProportionally
    }
    
    

    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setCollectionView()
        getRulesAndTodoList()
        setRuleLabel()
        setTodoLabel()
        setCheckBoxIsDone()
    }
    
    private func setCheckBoxImage(_ button: UIButton,_ isDone: Bool) {
        button.isSelected = isDone
    }
    
    //MARK: Custom Methods
    private func getRulesAndTodoList() {
        rules = RulesDataModel.sampleData
        todos = TodoDataModel.sampleData
    }
    
    private func setCollectionView() {
        incomingEventsCollectionView.register(cell: EventsCollectionViewCell.self)
        profileCollectionView.register(cell: ProfileCollectionViewCell.self)
        
        
        incomingEventsCollectionView.delegate = self
        incomingEventsCollectionView.dataSource = self
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
    }
    
    private func setCheckBoxIsDone() {
        setCheckBoxImage(todoLabel1.checkButton, todos?[0].isDone ?? false)
        setCheckBoxImage(todoLabel2.checkButton, todos?[1].isDone ?? false)
        setCheckBoxImage(todoLabel3.checkButton, todos?[2].isDone ?? false)
        setCheckBoxImage(todoLabel4.checkButton, todos?[3].isDone ?? false)
        setCheckBoxImage(todoLabel5.checkButton, todos?[4].isDone ?? false)
    }
    
    private func setRuleLabel() {
        ruleLabel1.setRulesLabelData(rule: rules?[0].ruleString ?? "")
        ruleLabel2.setRulesLabelData(rule: rules?[1].ruleString ?? "")
        ruleLabel3.setRulesLabelData(rule: rules?[2].ruleString ?? "")
        ruleLabel4.setRulesLabelData(rule: rules?[3].ruleString ?? "")
        ruleLabel5.setRulesLabelData(rule: rules?[4].ruleString ?? "")
    }
    
    private func setTodoLabel() {
        todoLabel1.setRulesLabelData(rule: todos?[0].todoString ?? "")
        todoLabel2.setRulesLabelData(rule: todos?[1].todoString ?? "")
        todoLabel3.setRulesLabelData(rule: todos?[2].todoString ?? "")
        todoLabel4.setRulesLabelData(rule: todos?[3].todoString ?? "")
        todoLabel5.setRulesLabelData(rule: todos?[4].todoString ?? "")
    }
    
    private func render() {
        view.addSubViews([titleLabel,eventStackView, rulesTodoStackView, profileStackView])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview()
        }
        
        incomingEventsCollectionView.snp.makeConstraints {
            $0.height.equalTo(95)
        }
        
        eventStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        ruleTotalStackView.snp.makeConstraints {
            $0.width.equalTo(Size.screenWidth * (156 / 375))
        }
        
        todosTotalStackView.snp.makeConstraints {
            $0.width.equalTo(Size.screenWidth * (156 / 375))
        }
        
        rulesTodoStackView.snp.makeConstraints {
            $0.leading.equalTo(eventStackView.snp.leading)
            $0.top.equalTo(eventStackView.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileCollectionView.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        profileStackView.snp.makeConstraints {
            $0.leading.equalTo(eventStackView.snp.leading)
            $0.top.equalTo(rulesTodoStackView.snp.bottom).offset(25)
            $0.trailing.equalToSuperview().inset(24)
            
        }
    }
}


//MARK: Delegate & Datasource
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == incomingEventsCollectionView {
            return EventDataModel.sampleData.count + 1
        }
        
        return ProfileDataModel.sampleData.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == incomingEventsCollectionView {
            guard let cell = incomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.className, for: indexPath) as? EventsCollectionViewCell else { return UICollectionViewCell() }
            
            if indexPath.row == 0 {
                cell.d_dayLabel.isHidden = true
                cell.addIcon.isHidden = false
                cell.backgroudImageView.image = nil
                cell.backgroundColor = UIColor(hex: "FFF8E6")
                return cell
            } else {
                cell.d_dayLabel.isHidden = false
                cell.addIcon.isHidden = true
                cell.backgroudImageView.image = UIImage(systemName: "clock")
                cell.backgroundColor = UIColor(hex: "FFDE8A")
            }
            
            cell.setEventCellData(EventDataModel.sampleData[indexPath.row - 1])
            return cell
        }
        
        guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.className, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == ProfileDataModel.sampleData.count {
            cell.profileStack.isHidden = true
            cell.codeViewStack.isHidden = false
            
            return cell
        }
        
        cell.setProfileData(ProfileDataModel.sampleData[indexPath.row])
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == incomingEventsCollectionView {
            if indexPath.row == 0 {
                return Size.addEventCellSize
            }
            
            return Size.eventCellSize
        }
        
        return CGSize(width: 156, height: 156)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == incomingEventsCollectionView {
            return 0
        }
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == incomingEventsCollectionView {
            return 8
        }
        return 15
    }
}
