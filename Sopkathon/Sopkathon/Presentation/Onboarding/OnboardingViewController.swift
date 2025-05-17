//
//  OnboardingViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class OnboardingViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private var startButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "서비스 설명"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 30)
        }
        
        startButton.do {
            $0.setTitle("시작하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0)
            $0.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, startButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(270)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
    }
}
