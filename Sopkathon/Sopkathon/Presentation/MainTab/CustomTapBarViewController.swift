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
        // TODO: 여기 gray를 Main으로 바꿔주세요
        self.tabBar.backgroundColor = .gray
        
        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(resource: .homeIcon)
        items[1].image = UIImage(resource: .myPageIcon)
    }
}

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
