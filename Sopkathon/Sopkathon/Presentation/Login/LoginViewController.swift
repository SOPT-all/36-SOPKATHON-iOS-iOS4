//
//  LoginViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    
    private lazy var studentButton = createTypeButton(title: "대학생")
    private lazy var unionButton = createTypeButton(title: "농축업 종사자")
    
    private lazy var idTextField = createTextField(placeholder: "아이디를 입력해주세요")
    private lazy var passwordTextField = createTextField(placeholder: "비밀번호를 입력해주세요")
    
    private lazy var goToRegisterButton = UIButton()
    private lazy var loginButton = UIButton()
    
    
    private func createTypeButton(title: String) -> UIButton {
        return UIButton().then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .head_rg_16
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.primary.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
        }
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        return UITextField().then {
            $0.placeholder = placeholder
            $0.textColor = .black
            $0.borderStyle = .none
            $0.font = .body_rg_16
            
            $0.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    .foregroundColor: UIColor.gray300
                ]
            )
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 42, width: 343, height: 1)
            bottomLine.backgroundColor = UIColor.gray200.cgColor
            $0.layer.addSublayer(bottomLine)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        logoImageView.do {
            $0.image = UIImage(resource: .logoWhite)
        }
        
        goToRegisterButton.do {
            let underlineAttrString = NSAttributedString(
                string: "회원가입",
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.black,
                    .font: UIFont.body_rg_16
                ])
            $0.setAttributedTitle(underlineAttrString, for: .normal)
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .primary
            $0.layer.borderColor = UIColor.primary.cgColor
            $0.layer.cornerRadius = 12
            $0.titleLabel?.font = .head_sb_20
        }
    }
    
    private func setUI() {
        view.addSubviews(
            logoImageView,
            studentButton,
            unionButton,
            idTextField,
            passwordTextField,
            goToRegisterButton,
            loginButton
        )
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(118)
        }
        
        studentButton.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        
        unionButton.snp.makeConstraints {
            $0.centerY.equalTo(studentButton)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        [studentButton, unionButton].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(142)
                $0.height.equalTo(53)
            }
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(studentButton.snp.bottom).offset(64)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(24)
        }
        
        [idTextField, passwordTextField].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalTo(343)
                $0.height.equalTo(43)
            }
        }
        
        goToRegisterButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(218)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(goToRegisterButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(60)
        }
    }
    
    private func setAddTarget() {
        studentButton.addTarget(self, action: #selector(studentButtonTapped), for: .touchUpInside)
        unionButton.addTarget(self, action: #selector(unionButtonTapped), for: .touchUpInside)
        goToRegisterButton.addTarget(self, action: #selector(goToRegisterButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func updateButtonSelection(selectedButton: UIButton) {
        let buttons = [studentButton, unionButton]
        
        for button in buttons {
            if button == selectedButton {
                button.backgroundColor = .primaryLight
                button.setTitleColor(.primaryDark, for: .normal)
                button.titleLabel?.font = .head_sb_16
            } else {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    @objc private func studentButtonTapped() {
        updateButtonSelection(selectedButton: studentButton)
    }
    
    @objc private func unionButtonTapped() {
        updateButtonSelection(selectedButton: unionButton)
    }
    
    @objc private func goToRegisterButtonTapped() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func loginButtonTapped() {
        let tabBarVC = CustomTabBarVC()
        navigationController?.pushViewController(tabBarVC, animated: true)
    }
}
