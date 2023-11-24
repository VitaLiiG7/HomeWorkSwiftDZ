
import UIKit

final class CollectionViewController: UIViewController {
    
    private var dataSource: [Hero] = []
    
    private let networkManager = Networkmanager()
        
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 350, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.184, green: 0.184, blue: 0.184, alpha: 1.00)
        collectionView.backgroundColor  = UIColor(red: 0.184, green: 0.184, blue: 0.184, alpha: 1.00)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "\(CharacterCollectionViewCell.self)")
        fetchCharacters()
        setupConstraints()
    }
    
    private func fetchCharacters() {
        networkManager.obtainСartoonСharacters { [weak self] (result) in
            guard let self = self else { return }
            self.dataSource = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterCollectionViewCell.self)", for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(model: dataSource[indexPath.row])
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = dataSource[indexPath.row].id
        networkManager.getInformationCartoonCharacters(id: id ?? 0) { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let characterInformationVC = CharacterInformationViewController(hero: result)
                self.navigationController?.pushViewController(characterInformationVC, animated: true)
            }
        }
    }
}
