//
//import UIKit
//
//class PersozhanViewController: UIViewController {
//
//    var hero: Hero
//    
//    let statusLabel: UILabel = {  //имя
//        let statusLabel = UILabel()
//        statusLabel.textColor = .blue
//        return statusLabel
//    }()
//    
//    let liveStatusLabel: UILabel = {  //имя
//        let liveStatusLabel = UILabel()
//        liveStatusLabel.textColor = .systemGray2
//        liveStatusLabel.text = "Liva status:"
//        return liveStatusLabel
//    }()
//    
//    let lastLocationLabel: UILabel = { //Earth(Repacement
//        let lastLocation = UILabel()
//        lastLocation.font = UIFont(name: "Times New Roman", size: 20)
//        lastLocation.textColor = .green
//        lastLocation.numberOfLines = 0
//       return lastLocation
//    }()
//    
//    let nameLabel: UILabel = {
//        let nameLabel = UILabel()
//        nameLabel.font = UIFont(name: "Times New Roman", size: 20)
//        nameLabel.numberOfLines = 0
//        nameLabel.textColor = .red
//       return nameLabel
//    }()
//    
//    let AlivenameLabel: UILabel = {
//        let AlivenameLabel = UILabel()
//        AlivenameLabel.font = UIFont(name: "Times New Roman", size: 20)
//        AlivenameLabel.numberOfLines = 0
//        AlivenameLabel.textColor = .blue
//       return AlivenameLabel
//    }()
//    
//    let PilotnameLabel: UILabel = {
//        let PilotnameLabel = UILabel()
//        PilotnameLabel.font = UIFont(name: "Times New Roman", size: 20)
//        PilotnameLabel.numberOfLines = 0
//        PilotnameLabel.textColor = .green
//       return PilotnameLabel
//    }()
//    
//
//    let genderNameLabel: UILabel = {  //Human
//        var genderNameLabel = UILabel()
//        genderNameLabel.numberOfLines = 0
//        genderNameLabel.textColor = .brown
//        genderNameLabel.font = UIFont(name: "Times New Roman", size: 22)
//        return genderNameLabel
//    }()
//    
//    let characterImage = UIImageView()
//    
//    let stackView: UIStackView = {
//        let stakView = UIStackView()
//        stakView.axis = .vertical
//        stakView.distribution = .fillEqually
//        stakView.alignment = .center
//        stakView.spacing = -100
//        stakView.backgroundColor = .darkGray
//        stakView.alignment = .leading
////        stakView.addArrangedSubview(statusLabel.)
//       
//        
//        return stakView
//    }()
//    
//    init(hero: Hero) {
//        self.hero = hero
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setup()
//    }
////    addArrangedSubview
//    func setup() {
//        statusLabel.text = hero.name
//        nameLabel.text = hero.type
//        AlivenameLabel.text = "\u{1F7E2} \(hero.status?.rawValue ?? "")"
//        PilotnameLabel.text = "First seen in \n\(hero.episode?.hashValue ?? 0)"
//        
//        lastLocationLabel.text = "Last known location: \n\(hero.location?.name ?? "")"
//        genderNameLabel.text = "Species and gender: \n\(hero.species?.rawValue ?? "")(\(hero.gender?.rawValue ?? ""))"
//        view.backgroundColor = .white
//        self.view.addSubview(stackView)
//        stackView.addArrangedSubview(liveStatusLabel)
//        stackView.addArrangedSubview(AlivenameLabel)
//        stackView.addArrangedSubview(genderNameLabel)
//        stackView.addArrangedSubview(lastLocationLabel)
//        stackView.addArrangedSubview(PilotnameLabel)
//        stackView.addArrangedSubview(nameLabel)
//        
//       
//
//        
//      
//       
//    
//       
//        guard let imageURL = URL(string: hero.image ?? "")  else { return }
//        characterImage.load(url: imageURL)
//        
//        [statusLabel, characterImage, stackView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//           
//        }
//      
//        setupConstraints()
//
//    }
//    func setupConstraints() {
//    NSLayoutConstraint.activate([
//        statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        statusLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 5),
////        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
////        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////        nameLabel.topAnchor.constraint(equalTo: view.topAnchor),
////        nameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant:  10),
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        stackView.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 40),
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
//        liveStatusLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -70),
////        AlivenameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -50)
//    
////        locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
////        locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//    
//    
//    
//    
//    ])
//        setupImageConstraint()
//        }
//    
//    func setupImageConstraint() {
//        NSLayoutConstraint.activate([
//            characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
////            characterImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            characterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//        characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            characterImage.heightAnchor.constraint(equalToConstant: 200)
//            
//        ])
//    }
//                                
//}
