//
//  TestCell.swift
//  HousLab_iOS
//
//  Created by 김호세 on 2022/07/06.
//

import UIKit

final class TestCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}
