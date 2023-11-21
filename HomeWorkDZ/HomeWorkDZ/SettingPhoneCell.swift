
import UIKit

final class SettingPhoneCell: UITableViewCell {
    
    static let identifier = "SettingPhoneCell"
    
    private let iconContainer: UIView = {
        let iconContainer = UIView()
        iconContainer.clipsToBounds = true
        iconContainer.layer.cornerRadius = 8
        iconContainer.layer.masksToBounds = true
        return iconContainer
    }()
    
    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        return iconImageView
    }()
    
    private let nameIconlabel: UILabel = {
        let nameIconlabel = UILabel()
        nameIconlabel.numberOfLines = 1
        return nameIconlabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
   private func setupUI() {
        contentView.addSubview(nameIconlabel)
        contentView.addSubview(iconContainer)
        iconContainer .addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setDimensions()
    }
    
   private func setDimensions() {
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 1, y: 7, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: 1, y: 1, width: imageSize*1.5, height: imageSize*1.5)
        nameIconlabel.frame = CGRect(x: 20 +  iconContainer.frame.size.width, y: 0, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameIconlabel.text = nil
        iconContainer.backgroundColor = nil
        iconImageView.image = nil
    }
    
    public func configure(with model: SettingOption) {
        nameIconlabel.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
