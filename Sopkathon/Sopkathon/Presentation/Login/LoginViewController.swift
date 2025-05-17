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
            $0.setTitleColor(UIColor(red: 0.104, green: 0.104, blue: 0.104, alpha: 1), for: .normal)
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            $0.layer.borderColor = UIColor(red: 0.173, green: 0.71, blue: 0.424, alpha: 1).cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
        }
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        return UITextField().then {
            $0.placeholder = placeholder
            $0.textColor = .black
            $0.borderStyle = .none
            $0.font = .systemFont(ofSize: 16)
            
            $0.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    .foregroundColor: UIColor(red: 0.738, green: 0.738, blue: 0.738, alpha: 1)
                ]
            )
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 42, width: 343, height: 1)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
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
            $0.image = UIImage(systemName: "person.circle")
        }
        
        goToRegisterButton.do {
            let underlineAttrString = NSAttributedString(
                string: "회원가입",
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor(red: 0.104, green: 0.104, blue: 0.104, alpha: 1),
                    .font: UIFont.systemFont(ofSize: 16)
                ])
            $0.setAttributedTitle(underlineAttrString, for: .normal)
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = UIColor(red: 0.173, green: 0.71, blue: 0.424, alpha: 1)
            $0.layer.borderColor = UIColor(red: 0.173, green: 0.71, blue: 0.424, alpha: 1).cgColor
            $0.layer.cornerRadius = 12
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
            $0.width.height.equalTo(77)
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
        let selectedBackgroundColor = UIColor(red: 0.838, green: 0.953, blue: 0.891, alpha: 1)
        let selectedTextColor = UIColor(red: 0.079, green: 0.531, blue: 0.29, alpha: 1)
        let defaultBackgroundColor = UIColor.white
        let defaultTextColor = UIColor(red: 0.104, green: 0.104, blue: 0.104, alpha: 1)
        
        let buttons = [studentButton, unionButton]
        
        for button in buttons {
            if button == selectedButton {
                button.backgroundColor = selectedBackgroundColor
                button.setTitleColor(selectedTextColor, for: .normal)
            } else {
                button.backgroundColor = defaultBackgroundColor
                button.setTitleColor(defaultTextColor, for: .normal)
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
