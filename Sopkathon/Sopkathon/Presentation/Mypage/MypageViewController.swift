//
//  MypageViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit
import SnapKit
import Then

final class MypageViewController: UIViewController {
    
    private let logoHeader = LogoHeader()
    
    private let topBackgroundView = UIView()
    private let profileBackgroundView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private var myActivityLabel = UILabel()
    private var suggestLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        fetchMypageData()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        topBackgroundView.backgroundColor = .primaryPastel
        
        profileBackgroundView.do {
            $0.backgroundColor = UIColor(red: 0.964, green: 0.964, blue: 0.964, alpha: 1)
            $0.layer.cornerRadius = 45.5
            $0.layer.borderColor = UIColor.gray100.cgColor
            $0.layer.borderWidth = 1
            $0.clipsToBounds = true
        }
        
        profileImageView.do {
            $0.image = UIImage(resource: .icMypage)
            $0.contentMode = .scaleAspectFit
        }
        
        nameLabel.do {
            $0.text = "이름"
            $0.textColor = .black
            $0.font = .head_sb_16
        }
        
        phoneNumberLabel.do {
            $0.text = "010-3333-2222"
            $0.textColor = .black
            $0.font = .body_rg_14
        }
        
        myActivityLabel.do {
            $0.text = "내가 참여한 활동"
            $0.textColor = .black
            $0.font = .head_sb_20
        }
        
        suggestLabel.do {
            $0.text = "후기를 작성해보세요!"
            $0.textColor = .gray500
            $0.font = .body_rg_14
        }
    }
    
    private func setUI() {
        view.addSubviews(topBackgroundView, logoHeader, myActivityLabel, suggestLabel)
        topBackgroundView.addSubviews(profileBackgroundView, nameLabel, phoneNumberLabel)
        profileBackgroundView.addSubview(profileImageView)
    }
    
    private func setLayout() {
        logoHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        topBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(phoneNumberLabel.snp.bottom).offset(38)
        }
        
        profileBackgroundView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(91)
        }
        
        profileImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileBackgroundView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        myActivityLabel.snp.makeConstraints {
            $0.top.equalTo(topBackgroundView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
        }
        
        suggestLabel.snp.makeConstraints {
            $0.top.equalTo(myActivityLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }
    }
    
    private func fetchMypageData() {
        let userId = 2
        MypageService.shared.getMypage(id: userId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let responseModel):
                if let firstActivity = responseModel.data.participationCompleteActivities.first {
                        self.nameLabel.text = "\(firstActivity.userId)번 user"
                        self.phoneNumberLabel.text = self.formatPhoneNumber(firstActivity.telephone)
                } else {
                    print("참여 완료 활동이 없습니다.")
                }
                
            case .failure(let error):
                print("마이페이지 조회 실패: \(error.localizedDescription)")
            }
        }
    }
    
    private func formatPhoneNumber(_ phoneNumber: String) -> String {
        let digits = phoneNumber.filter { $0.isNumber }
        
        switch digits.count {
        case 10:
            let start = digits.prefix(3)
            let middle = digits.dropFirst(3).prefix(3)
            let end = digits.suffix(4)
            return "\(start)-\(middle)-\(end)"
        case 11:
            let start = digits.prefix(3)
            let middle = digits.dropFirst(3).prefix(4)
            let end = digits.suffix(4)
            return "\(start)-\(middle)-\(end)"
        default:
            return phoneNumber
        }
    }
}
