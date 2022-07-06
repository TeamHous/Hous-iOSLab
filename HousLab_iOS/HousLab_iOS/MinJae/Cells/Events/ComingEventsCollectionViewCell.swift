//
//  ComingEventsCollectionViewCell.swift
//  HousLab_iOS
//
//  Created by 김민재 on 2022/07/06.
//

import UIKit

class ComingEventsCollectionViewCell: UICollectionViewCell {
    
    private enum Size {
        static let screenWidth = UIScreen.main.bounds.width
        static let addEventCellSize = CGSize(width: 72, height: 88)
        static let eventCellSize = CGSize(width: 88, height: 88)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "Coming up-"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    
    private var incomingEventsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        setEventCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubview(incomingEventsCollectionView)
        addSubview(subtitleLabel)
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(24)
        }
        
        incomingEventsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(24)
        }
    }
    
    private func setEventCollectionView() {
        incomingEventsCollectionView.register(cell: EventsCollectionViewCell.self)
        
        incomingEventsCollectionView.delegate = self
        incomingEventsCollectionView.dataSource = self
    }
    
}


extension ComingEventsCollectionViewCell: UICollectionViewDelegate {
    
}

extension ComingEventsCollectionViewCell: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventDataModel.sampleData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = incomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.className, for: indexPath) as? EventsCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == 0 {
            cell.d_dayLabel.isHidden = true
            cell.addIcon.isHidden = false
            cell.backgroudImageView.image = nil
            cell.backgroundColor = UIColor(hex: "FFF8E6")
            return cell
        } else {
            cell.d_dayLabel.isHidden = false
            cell.addIcon.isHidden = true
            cell.backgroudImageView.image = UIImage(systemName: "clock")
            cell.backgroundColor = UIColor(hex: "FFDE8A")
        }
        
        cell.setEventCellData(EventDataModel.sampleData[indexPath.row - 1])
        return cell
    }
    
    
}


extension ComingEventsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return Size.addEventCellSize
        }
        return Size.eventCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
