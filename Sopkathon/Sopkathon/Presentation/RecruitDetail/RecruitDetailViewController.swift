//
//  RecruitDetailViewController.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import UIKit

import SnapKit

final class RecruitDetailViewController: UIViewController {
    
    // TODO: 나연이뷰로 id랑 같이 넘겨주기
    private var subject: String = ""
    
    // MARK: - Properties
    private let postId: String
    private let recruitDetailService = RecruitDetailService.shared
    
    // Constants
    let horizontalPadding = 16
    
    // 스크롤뷰
    private let scrollView = UIScrollView().then {
        $0.contentInset = .init(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    // 스크롤뷰 -> 컨테이너뷰
    
    private let contentView = UIView()
    
    // 정보 & 썸네일
    
    private let recuritInfoView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let categoryLabel = UIButton().then {
        $0.setTitle("농사", for: .normal)
        $0.backgroundColor = .primaryLight
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.titleLabel?.font = .cap_md_20
        $0.setTitleColor(UIColor.primaryDark, for: .normal)
        $0.contentEdgeInsets = .init(top: 4, left: 12, bottom: 4, right: 12)
    }
    
    private let recuritInfoTitleLabel = UILabel().then {
        $0.text = "진천 꿀옥수수 수확 도와줄 친구 구합니다!dddddddddddddddddddddddddd"
        $0.font = .head_sb_16
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.lineBreakMode = .byCharWrapping
    }
    
    private let recuritInfoDateLabel = UILabel().then {
        $0.text = "3/30~4/3(2박 3일)"
        $0.font = .body_rg_12
    }
    private let guestLabel = UILabel().then {
        $0.text = "3/30명"
        $0.font = .body_rg_12
    }
    private let recuritInfoLoactionLabel = UILabel().then {
        $0.text = "제천"
        $0.font = .body_rg_12
    }
    private let recurithostAndAddmissionLabel = UILabel().then {
        $0.text = "주최자-참가비"
        $0.font = .body_rg_12
    }
    
    private lazy var detailInfoSStack = UIStackView().then {
        let stackView = $0
        $0.axis = .vertical
        $0.spacing = 4
        [recuritInfoLoactionLabel, recuritInfoDateLabel,recurithostAndAddmissionLabel , guestLabel ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private let divier = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    
    private let thumbnailImageView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    // 설명글
    private let descriptionTextView = UILabel().then {
        $0.text = "asdfasdfasdfdsfasdfasdfsdfsdfasdfasdfasdfasdfasdfasdfsdfsdfasdfasdfasdfasdfasdfasdfasdfasd\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n sdfasdfasdfadsfasdf \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n d      "
        $0.textColor = .gray
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    private let buttonContainer = UIView().then {
        $0.backgroundColor = .white
    }
    
    // 신청하기 버튼
    
    private let goToReviewButton = UIButton().then {
        $0.setTitle("후기 보러 가기", for: .normal)
        $0.backgroundColor = .primaryLight
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .head_sb_16
        $0.setTitleColor(UIColor.primaryDark, for: .normal)
    }
    
    private let requestButton =  UIButton().then {
        $0.setTitle("신청하기", for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .head_sb_16
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    init(postId: String = "1") {
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
        self.fetchRecruitDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        [goToReviewButton, requestButton].forEach {
            buttonContainer.addSubview($0)
        }
        [categoryLabel, recuritInfoTitleLabel, detailInfoSStack].forEach {
            recuritInfoView.addSubview($0)
        }
        [recuritInfoView, thumbnailImageView, divier, descriptionTextView].forEach {
            contentView.addSubview($0)
        }
        contentView.addSubview(buttonContainer)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    // Set constraints
    
    func setContstraints() {
        
        categoryLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        recuritInfoTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(categoryLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        detailInfoSStack.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(recuritInfoTitleLabel.snp.bottom).offset(8)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.horizontalEdges.equalTo(scrollView.contentLayoutGuide)
        }
        
        recuritInfoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(horizontalPadding)
            $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-horizontalPadding)
            $0.bottom.greaterThanOrEqualTo(thumbnailImageView.snp.bottom)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(160)
            $0.top.bottom.equalTo(recuritInfoView)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        divier.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(24)
            $0.height.equalTo(8)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(divier.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(horizontalPadding)
            $0.bottom.equalToSuperview().offset(24)
        }
        
        buttonContainer.snp.makeConstraints {
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide).inset(horizontalPadding)
            $0.bottom.equalTo(scrollView.frameLayoutGuide).offset(-35)
        }
        
        goToReviewButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.height.equalTo(54)
            $0.width.equalTo(145)
        }
        
        requestButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(goToReviewButton.snp.trailing).offset(8)
        }
    }
    
    func configure(model: RecruitDetailResponseModel) {        
        let tagName = model.tag == "AGRICULTURE" ? "농사" : "축산물"
        self.categoryLabel.setTitle(tagName, for: .normal)
        self.recuritInfoTitleLabel.text = model.title
        self.descriptionTextView.text = model.content
        self.recurithostAndAddmissionLabel.text = model.subject + "·" +  model.participationFee
        self.subject = model.subject
    }
}

// MARK: - API

extension RecruitDetailViewController {
    func fetchRecruitDetail() {
        Task {
            do {
                let response = try await recruitDetailService.fetchRequrestDetail(postId: self.postId)
                configure(model: response)
            } catch {
//                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    RecruitDetailViewController()
}
