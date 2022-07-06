//
//  CustomTabbarController.swift
//  HousLab_iOS
//
//  Created by 김호세 on 2022/07/06.
//

import UIKit

import RxSwift
import SnapKit

final class CustomTabbarController: UITabBarController {
  private let disposeBag = DisposeBag()


  private let helloworldLabel: UILabel = {
    let label = UILabel()
    label.text = "Hello Hous"
    label.backgroundColor = .white
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.addSubview(helloworldLabel)


    NSLayoutConstraint.activate([
      helloworldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      helloworldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
