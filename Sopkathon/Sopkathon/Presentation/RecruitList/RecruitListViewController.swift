import UIKit

final class RecruitListViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let recruitList = RecruitResponseModel.dummy()
    
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
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        tableView.separatorStyle = .none
        
        logoImageView.do {
            $0.image = UIImage(systemName: "pencil.line")
            $0.contentMode = .scaleAspectFit
        }
        
        agricultureButton.do {
            $0.setTitle("농사", for: .normal)
            $0.setTitleColor(.gray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            $0.backgroundColor = .white
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.cornerRadius = 16
        }
        
        livestockButton.do {
            $0.setTitle("축산업", for: .normal)
            $0.setTitleColor(.gray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            $0.backgroundColor = .white
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.cornerRadius = 16
        }
        
        excludeRecruitDeadlineButton.do {
            $0.setTitle("모집 마감 제외", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            $0.backgroundColor = .white
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray.cgColor
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
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
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
        agricultureButton.addTarget(self, action: #selector(agricultureButtonDidTap), for: .touchUpInside)
        livestockButton.addTarget(self, action: #selector(livestockButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func agricultureButtonDidTap() {
        updateButtonSelection(selected: agricultureButton, deselected: livestockButton)
    }

    @objc private func livestockButtonDidTap() {
        updateButtonSelection(selected: livestockButton, deselected: agricultureButton)
    }

    private func updateButtonSelection(selected: UIButton, deselected: UIButton) {
        selected.do {
            $0.layer.borderColor = UIColor.systemGreen.cgColor
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemGreen
        }
        
        deselected.do {
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.setTitleColor(.darkGray, for: .normal)
            $0.backgroundColor = .white
        }
    }
    
    private func setDelegate() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(RecruitListCell.self, forCellReuseIdentifier: RecruitListCell.identifier)
        }
    }
}

extension RecruitListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
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
