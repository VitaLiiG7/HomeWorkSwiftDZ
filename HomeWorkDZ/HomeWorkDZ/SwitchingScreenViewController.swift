
import UIKit

final class SwitchingScreenViewController: UIViewController {
    
    private lazy var openScreenCollectionsViewButton: UIButton = {
        let openScreenCollectionsViewbutton = UIButton()
        openScreenCollectionsViewbutton.setTitle("1 Задание", for: .normal)
        openScreenCollectionsViewbutton.backgroundColor = .blue
        openScreenCollectionsViewbutton.addTarget(self, action: #selector(buttonCollectionViewDidTapped), for: .touchUpInside)
        return openScreenCollectionsViewbutton
    }()
    
    private lazy var openScreenTableViewButton: UIButton = {
        let openScreenTableViewbutton = UIButton()
        openScreenTableViewbutton.setTitle("2 Задание", for: .normal)
        openScreenTableViewbutton.backgroundColor = .green
        openScreenTableViewbutton.addTarget(self, action: #selector(buttonTableViewDidTapped), for: .touchUpInside)
        return openScreenTableViewbutton
    }()
    
    private lazy var openScreenScrollViewButton: UIButton = { 
        let openScreenScrollViewbutton = UIButton()
        openScreenScrollViewbutton.setTitle("3 Задание", for: .normal)
        openScreenScrollViewbutton.backgroundColor = .red
        openScreenScrollViewbutton.addTarget(self, action: #selector(buttonScrollViewDidTapped), for: .touchUpInside)
        return openScreenScrollViewbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
   private func setupUI() {
        [openScreenCollectionsViewButton, openScreenTableViewButton, openScreenScrollViewButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
       setupСonstraint()
    }
    
    private func setupСonstraint() {
        NSLayoutConstraint.activate([openScreenCollectionsViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30),
                                     openScreenCollectionsViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
                                     openScreenCollectionsViewButton.widthAnchor.constraint(equalToConstant: 100),
                                     openScreenCollectionsViewButton.heightAnchor.constraint(equalToConstant: 50), openScreenTableViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  150),
                                     openScreenTableViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
                                     openScreenTableViewButton.widthAnchor.constraint(equalToConstant: 100),
                                     openScreenTableViewButton.heightAnchor.constraint(equalToConstant: 50), openScreenScrollViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  270),
                                     openScreenScrollViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
                                     openScreenScrollViewButton.widthAnchor.constraint(equalToConstant: 100),
                                     openScreenScrollViewButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    @objc private func buttonCollectionViewDidTapped() {
        let collectionVC = CollectionViewController()
        self.navigationController?.pushViewController(collectionVC, animated: true)
    }
    
    @objc private func buttonTableViewDidTapped() {
        let tableVC = TableViewController()
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    @objc private func buttonScrollViewDidTapped() {
        let scrollVC = ScrollViewController()
        navigationController?.pushViewController(scrollVC, animated: true)
    }
}



