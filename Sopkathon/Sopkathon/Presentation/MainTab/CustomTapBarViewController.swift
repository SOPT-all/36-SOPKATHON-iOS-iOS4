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
        let reviewVC = UINavigationController(rootViewController: ReviewListViewController(postId: "1"))
        
        self.setViewControllers([homeVC, reviewVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        // TODO: 여기 purple를 Main으로 바꿔주세요
        self.tabBar.tintColor = .purple
        self.tabBar.backgroundColor = .white
        
        guard let items = self.tabBar.items else { return }
        let homeItem = items[0]
        let myPageItem = items[1]
        homeItem.image = UIImage(resource: .homeIcon)
        myPageItem.image = UIImage(resource: .myPageIcon)
        homeItem.imageInsets = .init(top: 35, left: 0, bottom: 0, right: 0)
        myPageItem.imageInsets = .init(top: 35, left: 0, bottom: 0, right: 0)
    }
}

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
