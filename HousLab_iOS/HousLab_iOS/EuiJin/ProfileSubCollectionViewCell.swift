//
//  DemoCell.swift
//  HousLab_iOS
//
//  Created by 이의진 on 2022/07/07.
//

import UIKit
import SwiftUI

class ProfileSubCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "ProfileSubCollectionViewCell"
    
    
    //MARK: - Properties
    
    var profileImage = UIImageView().then {
        $0.image = UIImage(named: "Group 6995")
    }
    
    private lazy var profileGuideStackView = UIStackView().then{
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.axis = .vertical
        $0.spacing = 4
        
    }
    
    var userName = UILabel().then{
        $0.text = "최인영"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 26)
    }
    
    var userJob = UILabel().then{
        $0.text = "대학생"
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 13)
    }
    
    var statusMessage = UILabel().then{
        $0.text = "낮에 자고 밤에 일하는 부엉이"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15)
    }
    
    var tag1 = BasePaddingLabel(padding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)).then{
        $0.text = "부엉이"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
        $0.backgroundColor = .purple
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    //MARK: - Override Methods
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func configureUI(){
        self.backgroundColor = .white
        [profileImage, userName, userJob, profileGuideStackView].forEach {self.addSubview($0)}
        [userName, statusMessage, tag1].forEach {profileGuideStackView.addArrangedSubview($0)}
    }
    
    private func setConstraints(){
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            
        }
        
        profileGuideStackView.snp.makeConstraints { make in
            make.bottom.equalTo(profileImage.snp.bottom)
            make.leading.equalTo(profileImage.snp.trailing).offset(24)
        }
        
        userJob.snp.makeConstraints {make in
            make.centerY.equalTo(userName.snp.centerY).offset(3)
            make.leading.equalTo(userName.snp.trailing).offset(8)
            
        }
    }
        
}

struct VCPreView2:PreviewProvider {
    static var previews: some View {
        ProfileViewController().toPreview()
    }
}
    
