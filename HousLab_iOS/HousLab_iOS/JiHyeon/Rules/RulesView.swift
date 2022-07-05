//
//  RulesView.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit

class RulesView: UIView {
    
    enum Size {
        static let categoryCollectionItemSize = CGSize(width: 40, height: 40)
        static let categoryCollectionEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        static let categoryCollectionItemSpacing = CGFloat(24)
        static let todoCollectionItemSize = CGSize(width: 327, height: 80) // 기기마다 좀 다르게 ...
        static let todoCollectionEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        static let todoCollectionItemSpacing = CGFloat(8)
    }
    
    var navigationBarView = MainTabNavigationView()
    
    private var horizontalButtonView = UIView()
    var todayTodoButton = UIButton().then {
        $0.setImage(ImageLiteral.todayTodo, for: .normal)
    }
    var categoryCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()).then {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = Size.categoryCollectionItemSize
            layout.sectionInset = Size.categoryCollectionEdgeInsets
            layout.minimumInteritemSpacing = Size.categoryCollectionItemSpacing
            layout.scrollDirection = .horizontal
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private var todoDisplayView = UIView()
    private var todayTodoLabel = UILabel().then {
        // 폰트, 크기 어쩌구
        $0.text = "오늘의 to-do"
    }
    var myTodoButton = UIButton().then {
        $0.setTitle("나의 to-do ", for: .normal)
        $0.setImage(ImageLiteral.myTodoCheck, for: .normal)
        $0.setTitleColor(.systemPink, for: .normal)
        $0.setTitleColor(.systemRed, for: .selected)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.isSelected = false
    }
    var todoCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()).then {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = Size.todoCollectionItemSize
            layout.sectionInset = Size.todoCollectionEdgeInsets
            layout.minimumInteritemSpacing = Size.todoCollectionItemSpacing
            layout.scrollDirection = .vertical
            $0.collectionViewLayout = layout
            $0.showsVerticalScrollIndicator = false
            $0.register(TodayTodoCollectionViewCell.self, forCellWithReuseIdentifier: TodayTodoCollectionViewCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        
        self.addSubViews([navigationBarView, horizontalButtonView, todoDisplayView])
        horizontalButtonView.addSubViews([todayTodoButton, categoryCollectionView])
        todoDisplayView.addSubViews([todayTodoLabel, myTodoButton, todoCollectionView])
        
        navigationBarView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        horizontalButtonView.snp.makeConstraints { make in
            make.top.equalTo(navigationBarView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        todayTodoButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(todayTodoButton.snp.trailing).offset(20)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        todoDisplayView.snp.makeConstraints { make in
            make.top.equalTo(horizontalButtonView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        todayTodoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(8)
        }
        myTodoButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(todayTodoLabel.snp.centerY)
        }
        todoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(todayTodoLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
