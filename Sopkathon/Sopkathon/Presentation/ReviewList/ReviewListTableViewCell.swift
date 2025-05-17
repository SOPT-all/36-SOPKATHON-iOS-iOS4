//
//  ReviewListTableViewCell.swift
//  Sopkathon
//
//  Created by 이나연 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class ReviewListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ReviewListTableViewCell"

    // MARK: - UI Components
    
    private let userID = UILabel()
//    private let starIcon = UIImage().then {
//
//    }
    
    private let starRatingLabel = UILabel()
    
    private let date = UILabel()
    
//    private let activityImage = UIImage().then {
//
//    }
    
    private let activityTitle = UILabel()
    
//    private let placeImage = UIImage().then {
//
//    }
    
    private let activityPlace = UILabel()
    
    private let activityContent = UILabel().then {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUI()
            setLayout()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp Method

    private func setUI() {
        [userID, starRatingLabel, date, activityTitle, activityPlace, activityContent].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout(){
        userID.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        starRatingLabel.snp.makeConstraints {
            $0.top.equalTo(userID.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(10)
        }
        
        date.snp.makeConstraints {
            $0.top.equalTo(userID.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        activityPlace.snp.makeConstraints {
            $0.top.equalTo(starRatingLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        activityContent.snp.makeConstraints {
            $0.top.equalTo(activityPlace.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
    }
}

extension ReviewListTableViewCell {
    func dataBind(_ item: ReviewListModel) {
        userID.text = "\(item.userId)"
        starRatingLabel.text = "\(item.starRating)"
        date.text = item.date
        activityContent.text = item.content
    }
}
