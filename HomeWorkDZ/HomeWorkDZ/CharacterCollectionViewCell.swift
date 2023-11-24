import Foundation
import UIKit

final class CharacterCollectionViewCell: UICollectionViewCell {
     
   private let circleView: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 8
        circleView.clipsToBounds = true
        return circleView
    }()
    
    private let lastKnowLabel: UILabel = {
        let lastKnowLabel = UILabel()
        lastKnowLabel.textColor = .systemGray
        return lastKnowLabel
    }()
    
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return nameLabel
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .white
        return statusLabel
    }()
    
    private let locationLabel: UILabel = {
        var locationLabel = UILabel()
        locationLabel.numberOfLines = 0
        locationLabel.textColor = .white
        locationLabel.font = UIFont.boldSystemFont(ofSize: 20)
        locationLabel.font = UIFont(name: "Times New Roman", size: 14)
        return locationLabel
    }()
    
    private let characterImage = UIImageView()
    
    func configure(model: Hero) {
        nameLabel.text = model.name
        lastKnowLabel.text = "Last known location:"
        statusLabel.text = "\(model.status?.rawValue ?? "") - \(model.species?.rawValue ?? "")"
        locationLabel.text = model.location?.name ?? ""
        guard let imageURL = URL(string: model.image ?? "")  else { return }
        characterImage.load(url: imageURL)
        self.backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1.00)
        clipsToBounds = true
        [nameLabel, statusLabel, locationLabel, characterImage, lastKnowLabel, circleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        switch model.status {
        case.alive:
            circleView.backgroundColor = .green
        case.dead:
            circleView.backgroundColor = .red
        case.unknown:
            circleView.backgroundColor = .red
        default:
            return
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -110),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -55),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 45),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lastKnowLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            lastKnowLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            lastKnowLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            lastKnowLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        setupImageConstraint()
    }

   private func setupImageConstraint() {
        NSLayoutConstraint.activate([
        characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        characterImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        characterImage.topAnchor.constraint(equalTo: topAnchor),
        characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -200),
        circleView.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
        circleView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
        circleView.heightAnchor.constraint(equalToConstant: 13),
        circleView.widthAnchor.constraint(equalToConstant: 13)
        ])
    }
}
            
