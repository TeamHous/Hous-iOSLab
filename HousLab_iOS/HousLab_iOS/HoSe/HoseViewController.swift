//
//  HoseViewController.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/04.
//

import UIKit

final class HoseViewController: UIViewController {

  private let helloworldLabel: UILabel = {
    let label = UILabel()
    label.text = String.Home.HomeBye
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
    view.backgroundColor = R.Color.color1
  }


  private func setupViews() {
    view.addSubview(helloworldLabel)

    NSLayoutConstraint.activate([
      helloworldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      helloworldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
