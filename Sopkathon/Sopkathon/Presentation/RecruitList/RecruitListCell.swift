import UIKit
import SnapKit

final class RecruitListCell: UITableViewCell {
    
    private let bottomView = UIView()
    private let titleLabel = UILabel()
    private let dateImageView = UIImageView()
    private let dateLabel = UILabel()
    private let dateStackView = UIStackView()
    private let locationImageView = UIImageView()
    private let locationNameLabel = UILabel()
    private let locationStackView = UIStackView()
    private let openerAndFeeLabel = UILabel()
    private let filterLabel = UILabel()
    private let recruitInfoStackView = UIStackView()
    private let recruitImageView = UIImageView()
    
    static let identifier = "RecruitListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.selectionStyle = .none
        
        bottomView.do {
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.gray100.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
        }
        
        titleLabel.do {
            $0.font = .head_sb_14
            $0.textColor = .black
        }
        
        dateImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = .icCalendar
        }
        
        dateLabel.do {
            $0.font = .body_rg_12
            $0.textColor = .black
        }
        
        dateStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        locationImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = .icLocation
        }
        
        locationNameLabel.do {
            $0.font = .body_rg_12
            $0.textColor = .black
        }
        
        locationStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        openerAndFeeLabel.do {
            $0.font = .body_rg_12
            $0.textColor = .black
        }
        
        filterLabel.do {
            $0.font = .cap_md_10
            $0.textColor = .primaryDark
            $0.backgroundColor = .primaryLight
            $0.textAlignment = .center
        }
        
        recruitInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
        }
        
        recruitImageView.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 4
        }
    }
    
    private func setUI() {
        locationStackView.addArrangedSubviews(locationImageView, locationNameLabel)
        dateStackView.addArrangedSubviews(dateImageView, dateLabel)
        recruitInfoStackView.addArrangedSubviews(titleLabel, dateStackView, locationStackView, openerAndFeeLabel)
        
        bottomView.addSubviews(filterLabel, recruitInfoStackView, recruitImageView)
        addSubview(bottomView)
    }
    
    private func setLayout() {
        bottomView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(343)
            $0.height.equalTo(151)
        }
        
        filterLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(42)
            $0.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(14)
        }
        
        locationImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
        locationNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(21)
            $0.height.equalTo(14)
        }
        
        locationStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(41)
            $0.height.equalTo(16)
        }
        
        dateImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(84)
            $0.height.equalTo(16)
        }
        
        dateStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(41)
            $0.height.equalTo(16)
        }
        
        openerAndFeeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(14)
        }
        
        recruitInfoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(227)
        }
        
        recruitImageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(72)
            $0.height.equalTo(103)
        }
        
        bottomView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(123)
        }
    }
    
    func dataBind(recruitItem: RecruitResponseModel) {
        titleLabel.text = recruitItem.title
        dateLabel.text = "\(recruitItem.startTime) ~ \(recruitItem.endTime)"
        locationNameLabel.text = recruitItem.activityRegion
        openerAndFeeLabel.text = "\(recruitItem.opener)  ·  \(recruitItem.participationFee)원"
        filterLabel.text = recruitItem.tag
        recruitImageView.image = UIImage(named: recruitItem.thumbnail)
    }
}
