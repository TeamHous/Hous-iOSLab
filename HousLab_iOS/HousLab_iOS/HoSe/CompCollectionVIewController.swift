//
//  CompCollectionVIewController.swift
//  HousLab_iOS
//
//  Created by 김호세 on 2022/07/06.
//

import UIKit

import SnapKit

final class CompCollectionVIewController: UIViewController {

  private var cv: UICollectionView! = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }


  private func setupCollectionView() {
    cv = UICollectionView(frame: .zero, collectionViewLayout: CompCollectionVIewController.createLayout())

    cv.delegate = self
    cv.dataSource = self

    cv.register(TestCell.self, forCellWithReuseIdentifier: "TestCell")
    cv.backgroundColor = .white



    view.addSubview(cv)

    cv.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.leading.bottom.trailing.equalToSuperview()
    }
  }
}

extension CompCollectionVIewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 15
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? TestCell else { return UICollectionViewCell() }

    return cell
  }


}


extension CompCollectionVIewController {
  static func createLayout() -> UICollectionViewCompositionalLayout {
    let layout = UICollectionViewCompositionalLayout { (a, b ) in

      if a == 0 {
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(178)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(178))

        let group = NSCollectionLayoutGroup.horizontal(
          layoutSize: groupSize,
          subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets.leading = 20
        section.contentInsets.trailing = 20
        section.interGroupSpacing = 20

        return section
      }


      else {

        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(178)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .estimated(178))

        let group = NSCollectionLayoutGroup.horizontal(
          layoutSize: groupSize,
          subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets.leading = 20
        section.contentInsets.trailing = 20
        section.interGroupSpacing = 20

        section.orthogonalScrollingBehavior = .continuous
        return section
      }

    }

    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 50

    layout.configuration = config

    return layout
  }
}
