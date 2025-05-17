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
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    
    private var myActivityLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        
        profileImageView.do {
            $0.image = UIImage(systemName: "person.circle")
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = $0.frame.size.width / 2
        }
        
        nameLabel.do {
            $0.text = "이름"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
        }
        
        phoneNumberLabel.do {
            $0.text = "010-3333-2222"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
        }
        
        myActivityLabel.do {
            $0.text = "참여한 활동"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 25)
        }
        
    }
    
    private func setUI() {
        view.addSubviews(
            profileImageView, nameLabel, phoneNumberLabel, myActivityLabel
        )
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        myActivityLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
