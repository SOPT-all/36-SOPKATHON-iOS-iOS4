//
//  CustomTapBarViewController.swift
//  Sopkathon
//
//  Created by 권석기 on 5/17/25.
//

import UIKit

final class CustomTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        addTabItems()
    }    
    
    func addTabItems() {
        let homeVC = UINavigationController(rootViewController: ViewController())
        let reviewVC = UINavigationController(rootViewController: ViewController())
        let myPageVC = UINavigationController(rootViewController: ViewController())
        
        homeVC.title = "메인"
        reviewVC.title = "후기"
        myPageVC.title = "마이페이지"
        
        self.setViewControllers([homeVC, reviewVC, myPageVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .gray
        
        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(systemName: "")
        items[1].image = UIImage(named: "")
        items[2].image = UIImage(named: "")
    }
}

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
