//
//  ProfileSubView.swift
//  HousLab_iOS
//
//  Created by 이의진 on 2022/07/06.
//

import UIKit
import SwiftUI

class ProfileSubView: EuiJinBaseView {

    var profileImage = UIImageView().then {
        $0.image = UIImage(named: "Group 6995")
    }
    
    var userName = UILabel().then{
        $0.text = "최인영"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20)
    }
    
    var userJob = UILabel().then{
        $0.text = "대학생"
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 13)
    }
    
    var stateMessage = UILabel().then{
        $0.text = "낮에 자고 밤에 일하는 부엉.."
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 13)
    }
    
    override func setUp(){
        
    }
    
    override func configureUI() {
        self.backgroundColor = .white
        [profileImage, userName, userJob, stateMessage].forEach {self.addSubview($0)}
    }
    
    override func setConstraints() {
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            
        }
        
        userName.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-25)
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
        }
        
    }

}




