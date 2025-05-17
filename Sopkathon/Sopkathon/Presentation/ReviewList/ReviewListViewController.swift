//
//  ReviewListViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class ReviewListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var reviewsList: [ReviewListModel] = []
    private let reviewListApi = ReviewListService()
    private let postId: String
    
    // MARK: - UI Components
    
    private let navigationView = UIView()
    
    private let arrowIcon = UIImageView().then {
        $0.image = .arrow
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .head_sb_18
        $0.text = "업체 이름"
        $0.textColor = .black
    }
    private let listTableView = UITableView().then {
        $0.rowHeight = UITableView.automaticDimension
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setUI()
        setLayout()
        registerTableViewCell()

        getReviewList()

    }
        
    init(postId: String) {
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp Method
    
    private func setUI() {
        [navigationView, listTableView].forEach {
            self.view.addSubview($0)
        }
        
        [arrowIcon, nameLabel].forEach {
            navigationView.addSubview($0)
        }
    }
    
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.height.equalTo(60)
        }
        arrowIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func registerTableViewCell() {
        listTableView.register(ReviewListTableViewCell.self, forCellReuseIdentifier: ReviewListTableViewCell.identifier)
        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    private func getReviewList() {
        Task {
            reviewsList = try await reviewListApi.reviewRequest(postId: postId)
            listTableView.reloadData()
        }
    }
    
}


extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ReviewListTableViewCell.identifier,
                for: indexPath) as? ReviewListTableViewCell else { return UITableViewCell() }
            cell.dataBind(reviewsList[indexPath.row])
            return cell
    }

}

extension ReviewListViewController: UITableViewDelegate {
    
}
