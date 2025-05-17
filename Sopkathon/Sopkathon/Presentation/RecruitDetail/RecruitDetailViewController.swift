//
//  RecruitDetailViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit

import SnapKit

final class RecruitDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // 스크롤뷰
    private let scrollView = UIScrollView().then {
        $0.contentInset = .init(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    // 스크롤뷰 -> 컨테이너뷰
    
    private let contentView = UIView()
    
    // 정보 & 썸네일
    
    private lazy var recuritInfoStack = UIStackView().then {
        let stackView = $0
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        [recuritInfoTitleLabel,
         recuritInfoDateLabel,
         guestLabel,
         recuritInfoLoactionLabel,
         recurithostAndAddmissionLabel,
         categoryLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        $0.backgroundColor = .gray
    }
    
    private let recuritInfoTitleLabel = UILabel().then {
        $0.text = "제목ddddddddddddddddddddd"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let recuritInfoDateLabel = UILabel().then {
        $0.text = "3/30~4/3(2박 3일)"
    }
    private let guestLabel = UILabel().then {
        $0.text = "3/30명"
    }
    private let recuritInfoLoactionLabel = UILabel().then {
        $0.text = "제천"
    }
    private let recurithostAndAddmissionLabel = UILabel().then {
        $0.text = "주최자-참가비"
    }
    private let categoryLabel = UILabel().then {
        $0.text = "농사"
    }
    
    private let thumbnailImageView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private let goToShowReviewButton = UIButton().then {
        $0.setTitle("후기 보러 가기", for: .normal)
        $0.backgroundColor = .gray
    }
    
    // 설명글
    private let descriptionTextView = UILabel().then {
        $0.text = "asdfasdfasdfdsfasdfasdfsdfsdfasdfasdfasdfasdfasdfasdfsdfsdfasdfasdfasdfasdfasdfasdfasdfasd\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n sdfasdfasdfadsfasdf \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n d      "
        $0.textColor = .gray
        $0.numberOfLines = 0
    }
    
    // 신청하기 버튼
    private let requestButton = UIButton().then {
        $0.setTitle("신청하기", for: .normal)
        $0.backgroundColor = .red
    }
}

// MARK: LifeCyle

extension RecruitDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubViews()
        setContstraints()
    }
}

// MARK: - UI Setting

extension RecruitDetailViewController {
    
    // Set config
    
    func configure() {
        view.backgroundColor = .white
    }
    
    // Add subview
    
    func addSubViews() {
        [recuritInfoStack, thumbnailImageView, goToShowReviewButton, descriptionTextView].forEach {
            contentView.addSubview($0)
        }
        contentView.addSubview(requestButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    // Set constraints
    
    func setContstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.horizontalEdges.equalTo(scrollView.contentLayoutGuide)
        }
        
        recuritInfoStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-10)
            $0.bottom.greaterThanOrEqualTo(thumbnailImageView.snp.bottom)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.width.equalTo(161)
            $0.height.equalTo(119)
            $0.centerY.equalTo(recuritInfoStack.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        goToShowReviewButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(goToShowReviewButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        requestButton.snp.makeConstraints {
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide).inset(10)
            $0.bottom.equalTo(scrollView.frameLayoutGuide).offset(-30)
        }
    }
}

// MARK: - API

extension RecruitDetailViewController {
    
}

#Preview {
    RecruitDetailViewController()
}
