import UIKit
import Foundation

final class CollectionEpisodesViewController: UIViewController, CellDelegate {
    
    private var dataSource: [Episode] = []
    
    private var characters: CharacterCharacteristics?
    
    var episodeCharacter: [EpisodeCharacter] = []
    
    private let networkManager = NetworkManager()
    
    func didTapImage(with episodeCharacter: EpisodeCharacter) {
        let destinationViewController = CharacterDetailsViewController(episodeAndCharacter: episodeCharacter)
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }()
    
    private lazy var searhBar: UISearchBar = {
        let searhBar = UISearchBar()
        searhBar.searchBarStyle = .default
        searhBar.layer.borderWidth = 1
        searhBar.layer.borderColor = UIColor.systemGray2.cgColor
        searhBar.layer.cornerRadius = 8
        searhBar.placeholder = "Name or episode (ex.S01E01)..."
        searhBar.sizeToFit()
        return searhBar
    }()
    
    private let advancedFiltersButton: UIButton = {
        let advancedFiltersButton = UIButton()
        let iconImageView = UIImage(named: "icon")
        let rgbaColor = UIColor(red: 33 / 255.0, green: 150 / 255.0, blue: 243 / 255.0, alpha: 1.0)
        advancedFiltersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -70.38, bottom: 0, right: 0)
        advancedFiltersButton.setTitle("ADVENCED FILTERS", for: .normal)
        advancedFiltersButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 1.25)
        advancedFiltersButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        advancedFiltersButton.setTitleColor(rgbaColor, for: .normal)
        advancedFiltersButton.layer.cornerRadius = 4
        advancedFiltersButton.setImage(iconImageView, for: .normal)
        advancedFiltersButton.backgroundColor = UIColor(red: 227 / 255.0, green: 242 / 255.0, blue: 253 / 255.0, alpha: 1)
        return advancedFiltersButton
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 55
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 311, height: 357)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        [collectionView, logoImageView, searhBar, advancedFiltersButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        collectionView.dataSource = self
        collectionView.register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: "\(EpisodesCollectionViewCell.self)")
        navigationItem.backButtonTitle = "GO BACK"
        navigationController?.navigationBar.tintColor = .black
        fetchCharacters()
        setupConstraints()
    }
    
    private func fetchCharacters() {
        networkManager.obtainСartoonСharacters { [weak self] (result) in
            guard let self = self else { return }
            self.dataSource = result
            for episode in result{
                networkManager.obtainImage(url: episode.characters.randomElement() ?? "") {
                    (character) in
                    self.episodeCharacter.append(EpisodeCharacter(id: episode.id, name: episode.name, airDate: episode.airDate, episode: episode.episode, characters: character, url: episode.url, created: episode.created))
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            searhBar.widthAnchor.constraint(equalToConstant: 312),
            searhBar.heightAnchor.constraint(equalToConstant: 56),
            searhBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 67),
            searhBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            advancedFiltersButton.widthAnchor.constraint(equalToConstant: 312),
            advancedFiltersButton.heightAnchor.constraint(equalToConstant: 56),
            advancedFiltersButton.topAnchor.constraint(equalTo: searhBar.bottomAnchor, constant: 12),
            advancedFiltersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: advancedFiltersButton.bottomAnchor, constant:  30),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)])
    }
}

extension CollectionEpisodesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodeCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(EpisodesCollectionViewCell.self)", for: indexPath) as? EpisodesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .left
        
        let sortedArray = episodeCharacter.sorted { $0.episode < $1.episode }
        cell.configure(model: sortedArray[indexPath.item])
        cell.delegate = self
        cell.addGestureRecognizer(swipeGesture)
        return cell
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if let indexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) {
            if gesture.state == .ended {
                episodeCharacter.remove(at: indexPath.item)
                collectionView.deleteItems(at: [indexPath])
            }
        }
    }
}

extension UIViewController {
    func setNavigationItem() {
        let imageView = UIImageView(image: UIImage(named: "logo-black"))
        let item = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = item
    }
}
