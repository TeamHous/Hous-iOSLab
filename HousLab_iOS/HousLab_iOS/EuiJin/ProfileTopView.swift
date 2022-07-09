//
//  ProfileTopView.swift
//  HousLab_iOS
//
//  Created by 이의진 on 2022/07/08.
//

import UIKit
import SwiftUI

class ProfileTopView: EuiJinBaseView {
    
    //MARK: - Properties
    
    var appNameLabel = UILabel().then{
        $0.text = "Hous - ME"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 26)
    }
    
    var editProfileButton = UIButton().then{
        $0.setImage(UIImage(named: "edit"), for: .normal)
    }
    
    var settingProfileButton = UIButton().then{
        $0.setImage(UIImage(named: "edit"), for: .normal)
    }
    
    override func setUp(){
        
    }
    
    override func configureUI() {
        self.backgroundColor = .white
        [appNameLabel,editProfileButton, settingProfileButton].forEach {self.addSubview($0)}
    }
    
    override func setConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
        
        editProfileButton.snp.makeConstraints {make in
            make.trailing.equalToSuperview().offset(-60)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        settingProfileButton.snp.makeConstraints {make in
            make.trailing.equalToSuperview().offset(-24)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    

}

struct VCPreView1:PreviewProvider {
    static var previews: some View {
        ProfileViewController().toPreview()
    }
}

//
//}





