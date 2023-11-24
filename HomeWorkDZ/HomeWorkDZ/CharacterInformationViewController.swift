
import UIKit

final class CharacterInformationViewController: UIViewController {
    
   private var hero: Hero
    
   private let circleView: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 4
        circleView.clipsToBounds = true
        return circleView
    }()
    
   private let personnageNameLabel: UILabel = {
        let personnageNameLabel = UILabel()
        personnageNameLabel.textColor = .white
        personnageNameLabel.backgroundColor = .darkGray
        personnageNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return personnageNameLabel
    }()
    
   private let characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.font = UIFont(name: "Times New Roman", size: 20)
        characterNameLabel.numberOfLines = 0
        characterNameLabel.textColor = .white
        return characterNameLabel
    }()
    
   private let liveStatusLabel: UILabel = {
        let liveStatusLabel = UILabel()
        liveStatusLabel.textColor = .systemGray2
        liveStatusLabel.text = "Liva status:"
        liveStatusLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return liveStatusLabel
    }()
    
   private let genderNameLabel: UILabel = {
        var genderNameLabel = UILabel()
        genderNameLabel.numberOfLines = 0
        genderNameLabel.textColor = .white
        genderNameLabel.font = UIFont(name: "Times New Roman", size: 26)
        genderNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return genderNameLabel
    }()
    
   private let specialAndGenderLabel: UILabel = {
        let specialAndGenderLabel = UILabel()
        specialAndGenderLabel.textColor = .systemGray2
        specialAndGenderLabel.text = "Species and gender:"
        specialAndGenderLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return specialAndGenderLabel
    }()
    
   private let lastLocationLabel: UILabel = {
        let lastLocation = UILabel()
        lastLocation.font = UIFont(name: "Times New Roman", size: 20)
        lastLocation.textColor = .white
        lastLocation.numberOfLines = 0
        return lastLocation
    }()
    
   private let lastKnownLocationLabel: UILabel = {
        let lastknownLocationLabel = UILabel()
        lastknownLocationLabel.textColor = .systemGray2
        lastknownLocationLabel.text = "Last known location: "
        lastknownLocationLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return lastknownLocationLabel
    }()
    
    
   private let pilotnameLabel: UILabel = {
        let pilotnameLabel = UILabel()
        pilotnameLabel.font = UIFont(name: "Times New Roman", size: 20)
        pilotnameLabel.numberOfLines = 0
        pilotnameLabel.textColor = .white
        return pilotnameLabel
    }()
    
   private let firstSeenLabel: UILabel = {
        let firstSeenLabel = UILabel()
        firstSeenLabel.font = UIFont(name: "Times New Roman", size: 20)
        firstSeenLabel.textColor = .systemGray2
        firstSeenLabel.text = "First seen in:"
        firstSeenLabel.numberOfLines = 0
        return firstSeenLabel
    }()
    
   private let episodesLabel: UILabel = {
        let episodesLabel = UILabel()
        episodesLabel.font = UIFont(name: "Times New Roman", size: 20)
        episodesLabel.numberOfLines = 0
        episodesLabel.textColor = .white
        return episodesLabel
    }()
    
   private let episodesNameLabel: UILabel = {
        let episodesNameLabel = UILabel()
        episodesNameLabel.font = UIFont(name: "Times New Roman", size: 20)
        episodesNameLabel.textColor = .systemGray2
        episodesNameLabel.text = "Episodes:"
        episodesNameLabel.numberOfLines = 0
        return episodesNameLabel
    }()

   private let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.contentMode = .scaleAspectFit
        return characterImageView
    }()
    
   private let VerticalStackView: UIStackView = {
        let VerticalStackView = UIStackView()
        VerticalStackView.axis = .vertical
        VerticalStackView.distribution = .fillEqually
        VerticalStackView.alignment = .center
        VerticalStackView.spacing = 5
        VerticalStackView.backgroundColor = .darkGray
        VerticalStackView.alignment = .leading
        return VerticalStackView
    }()
    
   private let HorizontalStackView: UIStackView = {
        let HorizontalStackView = UIStackView()
        HorizontalStackView.axis = .horizontal
        HorizontalStackView.alignment = .leading
        HorizontalStackView.spacing = 10
        return HorizontalStackView
    }()
    
    init(hero: Hero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
   private func setup() {
        view.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.15, alpha: 1.00)
        personnageNameLabel.text = hero.name
        characterNameLabel.text = "\(hero.status?.rawValue ?? "")"
        pilotnameLabel.text = hero.episode?[0] ?? ""
        lastLocationLabel.text = hero.location?.name ?? ""
        genderNameLabel.text = "\(hero.species?.rawValue ?? "") (\(hero.gender?.rawValue ?? ""))"
        episodesLabel.text = hero.episode?[0] ?? ""
        view.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.15, alpha: 1.00)
        self.view.addSubview(VerticalStackView)
        HorizontalStackView.addArrangedSubview(circleView)
        HorizontalStackView.addArrangedSubview(characterNameLabel)
        VerticalStackView.addArrangedSubview(liveStatusLabel)
        VerticalStackView.addArrangedSubview(HorizontalStackView)
        VerticalStackView.addArrangedSubview(specialAndGenderLabel)
        VerticalStackView.addArrangedSubview(genderNameLabel)
        VerticalStackView.addArrangedSubview(lastKnownLocationLabel)
        VerticalStackView.addArrangedSubview(lastLocationLabel)
        VerticalStackView.addArrangedSubview(firstSeenLabel)
        VerticalStackView.addArrangedSubview(pilotnameLabel)
        VerticalStackView.addArrangedSubview(episodesNameLabel)
        VerticalStackView.addArrangedSubview(episodesLabel)
        guard let imageURL = URL(string: hero.image ?? "")  else { return }
        characterImageView.load(url: imageURL)
        [personnageNameLabel, characterImageView, VerticalStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
       
        switch hero.status {
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
            personnageNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            personnageNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            personnageNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 0),
            VerticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            VerticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            VerticalStackView.topAnchor.constraint(equalTo: personnageNameLabel.bottomAnchor, constant: 0),
            VerticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            HorizontalStackView.widthAnchor.constraint(equalToConstant: 100)])
   
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            genderNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            circleView.heightAnchor.constraint(equalToConstant: 8),
            circleView.widthAnchor.constraint(equalToConstant: 8),
            circleView.topAnchor.constraint(equalTo: HorizontalStackView.topAnchor, constant: 20),
            characterNameLabel.topAnchor.constraint(equalTo: HorizontalStackView.topAnchor, constant: 13)])
    }
}
