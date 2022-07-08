//
//  ProfileView.swift
//  HousLab_iOS
//
//  Created by 이의진 on 2022/07/06.
//

import UIKit
import SwiftUI

class ProfileViewController: EuiJinBaseViewController {
   
    //MARK: - Properties
    
    let identifiers = [ProfileSubCollectionViewCell.identifier]
    
    let cells = [ProfileSubCollectionViewCell.self]
    
    let profileMainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
        }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK: - Override Methods
    
    override func setUp(){

    }
    
    override func configureUI() {
        [profileMainCollectionView].forEach {self.view.addSubview($0)}
        profileMainCollectionView.backgroundColor = .yellow
        setDelegate()
        registerCell()
    }
    
    override func setConstraints() {
        profileMainCollectionView.snp.makeConstraints{ make in
            let width = UIScreen.main.bounds.width
            make.top.equalTo(view.safeAreaLayoutGuide).offset(width * (68/375))
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    //MARK: - Private Methods
    
    private func setDelegate(){
        self.profileMainCollectionView.delegate = self
        self.profileMainCollectionView.dataSource = self
    }
    
    
    private func registerCell(){
        self.cells.enumerated().forEach{
            profileMainCollectionView.register($1, forCellWithReuseIdentifier: identifiers[$0])
           }
       }
    
}

//MARK: - Delegate

extension ProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row{
        default:
            guard let cell = profileMainCollectionView.dequeueReusableCell(withReuseIdentifier: identifiers[0], for: indexPath) as? ProfileSubCollectionViewCell else {return UICollectionViewCell()}
            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        switch indexPath.row{
        case 0:
            return CGSize(width: width, height: width * (114 / 375))
        case 1:
            return CGSize(width: width, height: width * (354 / 375))
        case 2:
            return CGSize(width: width, height: width * (222 / 375))
        default:
            return CGSize(width: 0, height: 0)
        }
    }

    
}


struct VCPreView:PreviewProvider {
    static var previews: some View {
        ProfileViewController().toPreview()
    }
}
