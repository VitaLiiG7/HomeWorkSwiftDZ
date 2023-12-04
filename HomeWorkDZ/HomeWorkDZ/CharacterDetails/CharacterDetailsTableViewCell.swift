import UIKit

final class CharacterDetailsTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterDetailsTableViewCell"
    
    private let characteristicNameLabel: UILabel = {
        let nameCharacterLabel = UILabel()
        nameCharacterLabel.numberOfLines = 1
        nameCharacterLabel.font = UIFont(name: "", size: 16)
        nameCharacterLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameCharacterLabel.textColor = UIColor(red: 8 / 255.0, green: 31 / 255.0, blue: 50 / 255.0, alpha: 1)
        return nameCharacterLabel
    }()
    
    private let characteristicLabel: UILabel = {
        let nameCharacterLabel = UILabel()
        nameCharacterLabel.numberOfLines = 1
        nameCharacterLabel.font = UIFont(name: "", size: 14)
        nameCharacterLabel.textColor = UIColor(red: 110 / 255.0, green: 121 / 255.0, blue: 140 / 255.0, alpha: 1)
        return nameCharacterLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.addSubview(characteristicNameLabel)
        contentView.addSubview(characteristicLabel)
        characteristicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characteristicLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstraint() {
        NSLayoutConstraint.activate([
            characteristicNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            characteristicNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            characteristicNameLabel.heightAnchor.constraint(equalToConstant: 24),
            characteristicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            characteristicLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            characteristicLabel.heightAnchor.constraint(equalToConstant: 20),
            characteristicLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)])
    }
    
    public func configure(with model: CharacterInfo) {
        characteristicNameLabel.text = model.characteristicName
        characteristicLabel.text = model.characteristic
    }
}
