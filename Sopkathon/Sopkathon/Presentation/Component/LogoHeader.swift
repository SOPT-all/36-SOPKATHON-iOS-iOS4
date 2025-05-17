//
//  LogoHeader.swift
//  Sopkathon
//
//  Created by 이나연 on 5/18/25.
//

import UIKit

import SnapKit

final class LogoHeader: UIView {
    
    private let logoImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = .logoWhite
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .clear
        self.addSubview(logoImage)
    }
    
    private func setLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
        }
    }
}
