
import UIKit

final class CollectionViewController: UIViewController, UISearchBarDelegate {
     
   private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 16, y: 100, width: 350, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Поиск"
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private var data: [Photo] = [Photo(id: 1, imageName: "imageOne", price: "11 475 руб.", discount: "15%", priceWithoutDiscount: "13 500 руб.", clothingNameLabel: "Плащ"), Photo(id: 2, imageName: "imageTwo", price: "5 000 руб.", discount:  "50%", priceWithoutDiscount: "10 000 руб.", clothingNameLabel: "Куртка"), Photo(id: 3, imageName: "imageThree", price: "8 050 руб.", discount: "30%", priceWithoutDiscount: "11 500 руб.", clothingNameLabel: "Рубашка"), Photo(id: 4, imageName: "imageFour", price: "5 005 руб.", discount: "45%", priceWithoutDiscount: "9 100 руб.", clothingNameLabel: "Рубашка"), Photo(id: 5, imageName: "imageFive", price: "9 225 руб.", discount: "25%", priceWithoutDiscount: "12 300 руб.", clothingNameLabel: "Свитер"), Photo(id: 6, imageName: "imageSix", price: "3 690 руб.", discount: "45%", priceWithoutDiscount: "8 200 руб.", clothingNameLabel: "Костюм спортивный")]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 30)
        layout.itemSize = CGSize(width: 150, height: 260)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "\(PhotoCollectionViewCell.self)")
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCollectionViewCell.self)", for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(model: data[indexPath.row])
        return cell
    }
}
 
