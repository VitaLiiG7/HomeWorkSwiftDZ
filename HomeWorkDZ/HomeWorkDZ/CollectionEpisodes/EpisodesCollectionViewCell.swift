import UIKit

protocol CellDelegate: AnyObject {
    func didTapImage(with episodeCharacter: EpisodeCharacter)
}

final class EpisodesCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CellDelegate?
    
    private var episod: EpisodeCharacter?
    
    @objc private func imageTapped() {
        if let episode = episod {
            delegate?.didTapImage(with: episode)
        }
    }
    
    private lazy var characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.contentMode = .scaleAspectFill
        let gestuResponse = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        characterImageView.addGestureRecognizer(gestuResponse)
        characterImageView.isUserInteractionEnabled = true
        return characterImageView
    }()
    
    private let nameCharacterLabel: UILabel = {
        let nameCharacterLabel = UILabel()
        nameCharacterLabel.textColor = .black
        nameCharacterLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameCharacterLabel.numberOfLines = 0
        return nameCharacterLabel
    }()
    
    private let colorBackgroundView: UIView = {
        let colorBackgroundView = UIView()
        colorBackgroundView.layer.cornerRadius = 10
        colorBackgroundView.clipsToBounds = true
        colorBackgroundView.backgroundColor = UIColor(red: 249 / 255.0, green: 249 / 255.0, blue: 249 / 255.0, alpha: 1.0)
        return colorBackgroundView
    }()
    
    private let playImageView: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(named: "Play")
        heartImage.tintColor = UIColor(_colorLiteralRed: 49, green: 50, blue: 52, alpha: 1)
        heartImage.frame.size = CGSize(width: 26.72, height: 25.56)
        return heartImage
    }()
    
    private let nameSeriesLabel: UILabel = {
        let nameSeriesLabel = UILabel()
        nameSeriesLabel.numberOfLines = 0
        nameSeriesLabel.font = UIFont.systemFont(ofSize: 16)
        nameSeriesLabel.textColor = UIColor(red: 49 / 255.0, green: 50 / 255.0, blue: 52 / 255.0, alpha: 1)
        return nameSeriesLabel
    }()
    
    private let imageUploadButton: UIButton = {
        let imageUploadButton = UIButton()
        imageUploadButton.tintColor = UIColor(_colorLiteralRed: 48, green: 156, blue: 255, alpha: 1)
        imageUploadButton.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        imageUploadButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        imageUploadButton.frame.size = CGSize(width: 30, height: 27.52)
        return imageUploadButton
    }()
    
    @objc func buttonTapped() {
        if imageUploadButton.currentBackgroundImage == UIImage(named: "Vector") {
            imageUploadButton.setBackgroundImage(UIImage(named: "VectorRed"), for: .normal)
        } else  {
            imageUploadButton.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        }
    }
    
    func configure(model: EpisodeCharacter) {
        guard let imageURL = URL(string: model.characters.image )  else { return }
        characterImageView.load(url: imageURL)
        nameSeriesLabel.text = "\(model.name) | \(model.episode)"
        nameCharacterLabel.text = model.characters.name
        [colorBackgroundView, nameCharacterLabel, characterImageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false }
        clipsToBounds = true
        [nameSeriesLabel, playImageView, imageUploadButton].forEach {
            colorBackgroundView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false }
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 8
        self.episod = model
        installationImageConstraint()
        setupConstraints()
    }
    
    private func installationImageConstraint() {
        NSLayoutConstraint.activate([
            characterImageView.heightAnchor.constraint(equalToConstant: 180),
            characterImageView.widthAnchor.constraint(equalToConstant: 311),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            imageUploadButton.topAnchor.constraint(equalTo: colorBackgroundView.topAnchor, constant: 5),
            imageUploadButton.trailingAnchor.constraint(equalTo: colorBackgroundView.trailingAnchor, constant: -10),
            playImageView.topAnchor.constraint(equalTo: colorBackgroundView.topAnchor),
            playImageView.leadingAnchor.constraint(equalTo: colorBackgroundView.leadingAnchor, constant: 15)])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameSeriesLabel.topAnchor.constraint(equalTo: colorBackgroundView.topAnchor, constant: 5),
            nameSeriesLabel.centerXAnchor.constraint(equalTo: colorBackgroundView.centerXAnchor),
            nameSeriesLabel.widthAnchor.constraint(equalToConstant: 200),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameCharacterLabel.bottomAnchor.constraint(equalTo: colorBackgroundView.topAnchor, constant: -10),
            nameCharacterLabel.widthAnchor.constraint(equalToConstant: 200),
            colorBackgroundView.widthAnchor.constraint(equalToConstant: 311),
            colorBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            colorBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 314)])
    }
}

