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
    
    private let listTableView = UITableView()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        registerTableViewCell()
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
        [listTableView].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
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
