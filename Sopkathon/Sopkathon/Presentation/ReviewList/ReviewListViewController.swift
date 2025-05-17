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
    
    private let reviewsList = ReviewListModel.dummy()
    private let reviewListApi = ReviewListService()
    private let postId: String
    
    // MARK: - UI Components
    
//    private let reviewTitleLabel = UILabel().then {
//        $0.text = "후기"
//    }
//    
//    private let agricultureFilter = UIButton().then {
//        $0.setTitle("농활", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .gray
//    }
//    
//    private let farmingFilter = UIButton().then {
//        $0.setTitle("축산업", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .gray
//    }
    
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
//        reviewTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
//            $0.leading.equalToSuperview().inset(20)
//        }
//        
//        agricultureFilter.snp.makeConstraints {
//            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(15)
//            $0.leading.equalToSuperview().inset(20)
//            $0.height.equalTo(25)
//        }
//        
//        farmingFilter.snp.makeConstraints {
//            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(15)
//            $0.leading.equalTo(agricultureFilter.snp.trailing).offset(20)
//            $0.height.equalTo(25)
//        }
        
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
            try await reviewListApi.reviewRequest(postId: postId) //reviewList 배열 리턴
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
