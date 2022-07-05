//
//  RulesViewController.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit
import SnapKit
import Then

class RulesViewController: UIViewController {
    
    var mainView = RulesView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    private func setCollectionView() {
        mainView.categoryCollectionView.delegate = self
        mainView.categoryCollectionView.dataSource = self
        mainView.todoCollectionView.delegate = self
        mainView.todoCollectionView.dataSource = self
    }
}

extension RulesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case mainView.categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            return cell
        case mainView.todoCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayTodoCollectionViewCell.identifier, for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
}
