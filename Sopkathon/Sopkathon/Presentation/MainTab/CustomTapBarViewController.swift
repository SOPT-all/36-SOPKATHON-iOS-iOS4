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
        let homeVC = UINavigationController(rootViewController: RecruitListViewController())
        let mypageVC = UINavigationController(rootViewController: MypageViewController())
        
        self.setViewControllers([homeVC, mypageVC], animated: false)
        self.modalPresentationStyle = .fullScreen

        self.tabBar.tintColor = .primary
        self.tabBar.backgroundColor = .white
        
        guard let items = self.tabBar.items else { return }
        let homeItem = items[0]
        let myPageItem = items[1]
        homeItem.image = UIImage(resource: .homeIcon)
        myPageItem.image = UIImage(resource: .myPageIcon)
        homeItem.imageInsets = .init(top: 35, left: 0, bottom: 0, right: 0)
        myPageItem.imageInsets = .init(top: 35, left: 0, bottom: 0, right: 0)
        tabBar.layer.borderWidth = 0.50
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.clipsToBounds = true
    }
}

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
