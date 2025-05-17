//
//  ReviewListTableViewCell.swift
//  Sopkathon
//
//  Created by 이나연 on 5/17/25.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class ReviewListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ReviewListTableViewCell"

    // MARK: - UI Components
    
    private let userID = UILabel().then {
        $0.font = .body_md_14
        $0.textColor = .black
    }
    
    private let starIcon = UIImageView().then {
        $0.image = .starIcon
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private let starRatingLabel = UILabel().then {
        $0.font = .body_md_14
        $0.textColor = .black
    }
    
    private let date = UILabel().then {
        $0.font = .cap_rg_12
        $0.textColor = .gray500
    }
    
    private let activityImage = UIImageView().then {
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    private let activityContent = UILabel().then {
        $0.font = .body_rg_14
        $0.textColor = .gray900
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
        [userID, starIcon, starRatingLabel, date, activityImage, activityContent].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout(){
        userID.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        starIcon.snp.makeConstraints {
            $0.top.equalTo(userID.snp.bottom).offset(2)
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        starRatingLabel.snp.makeConstraints {
            $0.top.equalTo(userID.snp.bottom).offset(2)
            $0.leading.equalTo(starIcon.snp.trailing).offset(4)
        }
        
        date.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        activityImage.snp.makeConstraints {
            $0.width.height.equalTo(144)
            $0.top.equalTo(starIcon.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        activityContent.snp.makeConstraints {
            $0.top.equalTo(activityImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}

extension ReviewListTableViewCell {
    func dataBind(_ item: ReviewListModel) {
        userID.text = "@\(item.memberId)"
        starRatingLabel.text = "\(item.star)"
        activityImage.image = UIImage(resource: .assetCattle)
        date.text = formatDate(item.createDate)
        activityContent.text = item.content
    }
    
    func formatDate(_ isoDate: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let date = formatter.date(from: isoDate) else { return "" }

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy.MM.dd"

        return displayFormatter.string(from: date)
    }
}
