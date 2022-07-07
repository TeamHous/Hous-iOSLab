//
//  BaseView.swift
//  HousLab_iOS
//
//  Created by 이의진 on 2022/07/06.
//

import UIKit
import SnapKit
import SwiftUI
import Then


class EuiJinBaseView: UIView {
  
  //MARK: Initializer
  
  override init(frame: CGRect){
    super.init(frame: frame)
  
    setUp()
    configureUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder){
    fatalError("init(coder:) has nor been implemented")
  }
  
  //MARK: Methods
  
  func setUp(){
    
  }
  
  func configureUI(){
    self.backgroundColor = .white
  }
  
  func setConstraints(){
    
  }

}


