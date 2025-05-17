//
//  RegisterViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class RegisterViewController: UIViewController {
    
    private lazy var studentButton = createTypeButton(title: "개인회원")
    private lazy var unionButton = createTypeButton(title: "일손 구하는 회원")
    
    private lazy var nameTextField = createTextField(placeholder: "이름")
    private lazy var phoneNumberTextField = createTextField(placeholder: "전화번호")
    private lazy var passwordTextField = createTextField(placeholder: "패스워드")
    private lazy var nickNameTextField = createTextField(placeholder: "닉네임")
    
    private lazy var registerButton = createButton(title: "회원가입")
    private lazy var goToLoginButton = createButton(title: "로그인하러 가기")
    
    private func createTypeButton(title: String) -> UIButton {
        return UIButton().then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0)
            $0.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        return UITextField().then {
            $0.placeholder = placeholder
            $0.borderStyle = .roundedRect
            $0.textColor = .black
        }
    }
    
    private func createButton(title: String) -> UIButton {
        return UIButton().then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0)
            $0.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(
            studentButton,
            unionButton,
            nameTextField,
            phoneNumberTextField,
            passwordTextField,
            nickNameTextField,
            registerButton,
            goToLoginButton
        )
    }
    
    private func setLayout() {
        
        studentButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
        
        unionButton.snp.makeConstraints {
            $0.centerY.equalTo(studentButton)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(studentButton.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
            
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(90)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        goToLoginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }
}
