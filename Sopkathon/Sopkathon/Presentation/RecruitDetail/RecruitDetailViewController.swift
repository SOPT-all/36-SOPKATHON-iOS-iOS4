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
    private let recruitRequestService = RecruitRequestService.shared
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
        $0.text = " "
        $0.font = .head_sb_16
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.lineBreakMode = .byCharWrapping
    }
    
    private let recuritInfoDateLabel = UILabel().then {
        $0.font = .body_rg_12
        $0.text = "5/27 ~ 5/29"
    }
    private let guestLabel = UILabel().then {
        $0.font = .body_rg_12
        $0.text = " "
    }
    private let recuritInfoLoactionLabel = UILabel().then {
        $0.font = .body_rg_12
        $0.text = " "
    }
    private let recurithostAndAddmissionLabel = UILabel().then {
        $0.font = .body_rg_12
        $0.text = " "
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
        $0.textColor = .gray
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    private let buttonContainer = UIView().then {
        $0.isUserInteractionEnabled = false
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
    
    private lazy var requestButton =  UIButton().then {
        $0.setTitle("신청하기", for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .head_sb_16
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
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
//        [goToReviewButton, requestButton].forEach {
//            buttonContainer.addSubview($0)
//        }
        [categoryLabel, recuritInfoTitleLabel, detailInfoSStack].forEach {
            recuritInfoView.addSubview($0)
        }
        
        [recuritInfoView, thumbnailImageView, divier, descriptionTextView].forEach {
            contentView.addSubview($0)
        }
//        contentView.addSubview(buttonContainer)
        [scrollView, requestButton, goToReviewButton].forEach {
            view.addSubview($0)
        }
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
            $0.bottom.equalToSuperview().offset(-100)
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
        
        goToReviewButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.width.equalTo(145)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        requestButton.snp.makeConstraints {
            $0.leading.equalTo(goToReviewButton.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func configure(model: RecruitDetailResponseModel) {        
        let tagName = model.tag == "AGRICULTURE" ? "농사" : "축산물"
        self.categoryLabel.setTitle(tagName, for: .normal)
        self.recuritInfoTitleLabel.text = model.title
        self.descriptionTextView.text = model.content
        self.recurithostAndAddmissionLabel.text = model.subject + "·" +  model.participationFee
        self.guestLabel.text = "\(model.currentParticipantCount)/\(model.maxParticipation)"
        self.recuritInfoLoactionLabel.text = model.activityRegion
        self.subject = model.subject
    }
}

// MARK: - UI Action

extension RecruitDetailViewController {
    @objc private func requestButtonTapped() {
        print("ghihihihi")
        Task {
            do {
              try await recruitRequestService.requestRecruit(postId: self.postId)
                print("성공")
            } catch {
                print("실패")
            }
        }
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
