//
//  ViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/16/25.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    private let exampleService = ExampleService()
    
    private lazy var requestButton = UIButton().then {
        $0.setTitle("Request Post", for: .normal)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .green
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(requestButton)
        requestButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func requestButtonTapped() {
        Task {
            do {
                let result = try await exampleService.exmapleRequest()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
