import UIKit

final class RecruitListViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var recruitList: [RecruitResponseModel] = []
    
    private let logoImageView = UIImageView()
    private let agricultureButton = UIButton()
    private let livestockButton = UIButton()
    private let excludeRecruitDeadlineButton = UIButton()
    private let filterView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAction()
        setDelegate()
        setInitialSelection()
        
        //fetchRecruitList()
        fetchRecruitList(tag: "AGRICULTURE")
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        tableView.separatorStyle = .none
        
        logoImageView.do {
            $0.image = .logoWhite
            $0.contentMode = .scaleAspectFit
        }
        
        agricultureButton.do {
            $0.setTitle("농업", for: .normal)
            $0.setTitleColor(.primaryDark, for: .normal)
            $0.titleLabel?.font = .body_md_14
            $0.backgroundColor = .primaryLight
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.primary.cgColor
            $0.layer.cornerRadius = 16
        }
        
        livestockButton.do {
            $0.setTitle("목축업", for: .normal)
            $0.setTitleColor(.gray500, for: .normal)
            $0.titleLabel?.font = .body_md_14
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray400.cgColor
            $0.layer.cornerRadius = 16
        }
        
        excludeRecruitDeadlineButton.do {
            $0.setTitle("모집 마감 제외", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .body_rg_12
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray200.cgColor
            $0.layer.cornerRadius = 4
        }
        
        filterView.do {
            $0.backgroundColor = .clear
        }
    }
    
    private func setUI() {
        filterView.addSubviews(agricultureButton, livestockButton, excludeRecruitDeadlineButton)
        view.addSubviews(logoImageView, filterView, tableView)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(40)
        }
        
        agricultureButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(65)
            $0.height.equalTo(33)
        }
        
        livestockButton.snp.makeConstraints {
            $0.leading.equalTo(agricultureButton.snp.trailing).offset(10)
            $0.width.equalTo(65)
            $0.height.equalTo(33)
        }
        
        excludeRecruitDeadlineButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(113)
            $0.height.equalTo(30)
        }
        
        filterView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(filterView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setAction() {
        agricultureButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        livestockButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func filterButtonTapped(_ sender: UIButton) {
            let otherButton = (sender == agricultureButton) ? livestockButton : agricultureButton
            
            let willSelect = !sender.isSelected
            let otherSelected = otherButton.isSelected
            
            if !willSelect && !otherSelected { return } // 최소 하나는 선택
            
            sender.isSelected = willSelect
            updateStyle(for: sender)
            
            var tag: String? = nil
            
            if agricultureButton.isSelected && !livestockButton.isSelected {
                tag = "AGRICULTURE"
            } else if !agricultureButton.isSelected && livestockButton.isSelected {
                tag = "LIVESTOCK"
            } else {
                tag = nil
            }
            
            fetchRecruitList(tag: tag)
    }
    
    private func updateStyle(for button: UIButton) {
        if button.isSelected {
            button.layer.borderColor = UIColor.primary.cgColor
            button.setTitleColor(.primaryDark, for: .normal)
            button.backgroundColor = .primaryLight
        } else {
            button.layer.borderColor = UIColor.gray400.cgColor
            button.setTitleColor(.gray500, for: .normal)
            button.backgroundColor = .white
        }
    }
    
    private func setInitialSelection() {
        agricultureButton.isSelected = true
        livestockButton.isSelected = false
        updateStyle(for: agricultureButton)
        updateStyle(for: livestockButton)
    }
    
    private func setDelegate() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(RecruitListCell.self, forCellReuseIdentifier: RecruitListCell.identifier)
        }
    }

    private func fetchRecruitList(tag: String?) {
            var parameters = ["excludeClosed": "false"]
            if let tag = tag {
                parameters["tag"] = tag
            }
            
            RecruitListService.shared.fetchRecruitList(parameters: parameters) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let responseModel):
                    let data = responseModel.data
                    self.recruitList = data
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                case .failure(let error):
                    print("게시글 조회 실패: \(error.localizedDescription)")
                }
            }
        }
}

extension RecruitListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(RecruitDetailViewController(), animated: false)
    }
}

extension RecruitListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecruitListCell.identifier, for: indexPath) as? RecruitListCell else {
            return UITableViewCell()
        }
        cell.dataBind(recruitItem: recruitList[indexPath.row])
        return cell
    }
}
