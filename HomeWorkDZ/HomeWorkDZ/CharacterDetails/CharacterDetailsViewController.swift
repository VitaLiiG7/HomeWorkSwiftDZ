import UIKit
import AVFoundation

final class CharacterDetailsViewController: UIViewController, UITableViewDelegate, CellDelegate {
    
    func didTapImage(with episodeCharacter: EpisodeCharacter) {
    }
    
    private let imageUploadButton: UIButton = {
        let imageUploadButton = UIButton()
        imageUploadButton.setBackgroundImage(UIImage(named: "Camera"), for: .normal)
        imageUploadButton.addTarget(self, action: #selector(photoButton), for: .touchUpInside)
        return imageUploadButton
    }()
    
    @objc func photoButton() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let titleFont = UIFont(name: "ArialHebrew-Bold", size: 14)
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont]
        let titleAttributedString = NSMutableAttributedString(string: "Загрузите изображение", attributes: titleAttributes)
        actionSheet.setValue(titleAttributedString, forKey: "attributedTitle")
        
        let takePhotoAction = UIAlertAction(title: "Камера", style: .default) { _ in
            let cameraAlert = self.createCameraAlert()
            self.present(cameraAlert, animated: true, completion: nil)
        }
        
        let chooseFromGalleryAction = UIAlertAction(title: "Галерея", style: .default) { _ in
            let galleryAlert = self.createGalleryAlert()
            self.present(galleryAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(chooseFromGalleryAction)
        actionSheet.addAction(cancelAction)
        actionSheet.view.tintColor = UIColor(red: 58 / 255.0, green: 131 / 255.0, blue: 241 / 255.0, alpha: 1)
        actionSheet.view.layer.cornerRadius = 12
        present(actionSheet, animated: true, completion: nil)
    }
    
    func createCameraAlert() -> UIAlertController {
        let cameraAlert = UIAlertController(title: "Разрешить доступ к камере?", message: "Это необходимо, чтобы сканировать штрихкоды, номер карты и использовать другие возможности", preferredStyle: .actionSheet)
        let allowAction = UIAlertAction(title: "Разрешить", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        cameraAlert.addAction(allowAction)
        cameraAlert.addAction(cancelAction)
        return cameraAlert
    }
    
    func createGalleryAlert() -> UIAlertController {
        let galleryAlert = UIAlertController(title: "Разрешить доступ к Фото", message: "Это необходимо для добавления ваших фотографий", preferredStyle: .actionSheet)
        let allowAction = UIAlertAction(title: "Разрешить", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        galleryAlert.addAction(allowAction)
        galleryAlert.addAction(cancelAction)
        return galleryAlert
    }
    
    private let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.tintColor = .white
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 70
        characterImageView.clipsToBounds = true
        return characterImageView
    }()
    
    private let blackImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.image = UIImage(named: "logo-black")
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 70
        characterImageView.clipsToBounds = true
        return characterImageView
    }()
    
    private let characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.numberOfLines = 0
        characterNameLabel.textAlignment = .center
        characterNameLabel.font = UIFont.systemFont(ofSize: 32)
        characterNameLabel.textColor = UIColor(red: 8 / 255.0, green: 31 / 255.0, blue: 50 / 255.0, alpha: 1)
        return characterNameLabel
    }()
    
    private let tableNameLabel: UILabel = {
        let tableNameLabel = UILabel()
        tableNameLabel.font = UIFont.systemFont(ofSize: 20)
        tableNameLabel.text = "Informations"
        tableNameLabel.textColor = UIColor(red: 142 / 255.0, green: 142 / 255.0, blue: 147 / 255.0, alpha: 1)
        return tableNameLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CharacterDetailsTableViewCell.self, forCellReuseIdentifier: CharacterDetailsTableViewCell.identifier)
        return tableView
    }()
    
    private var episodeAndCharacter: EpisodeCharacter
    
    private var characterDetails: [CharacterInfo] = []
    
    init(episodeAndCharacter: EpisodeCharacter) {
        self.episodeAndCharacter = episodeAndCharacter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
     
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        [characterImageView, characterNameLabel, imageUploadButton, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false }
        tableView.addSubview(tableNameLabel)
        tableNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.text = episodeAndCharacter.characters.name
        guard let imageURL = URL(string: episodeAndCharacter.characters.image )  else { return }
        characterImageView.load(url: imageURL)
        self.setNavigationItem()
        configureConstraint()
        configureData()
        
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 148),
            characterImageView.widthAnchor.constraint(equalToConstant: 147),
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 47),
            characterNameLabel.widthAnchor.constraint(equalToConstant: 314.6),
            characterNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableNameLabel.topAnchor.constraint(equalTo: tableView.topAnchor),
            tableNameLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 18.02),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageUploadButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 182),
            imageUploadButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 11)])
    }
    
    private func configureData() {
        characterDetails = [CharacterInfo.init(characteristicName: "Gender", characteristic: episodeAndCharacter.characters.gender.rawValue),
                            CharacterInfo.init(characteristicName: "Status", characteristic: episodeAndCharacter.characters.status.rawValue),
                            CharacterInfo.init(characteristicName: "Specie", characteristic: episodeAndCharacter.characters.species.rawValue),
                            CharacterInfo.init(characteristicName: "Origin", characteristic: episodeAndCharacter.characters.origin.name),
                            CharacterInfo.init(characteristicName: "Type", characteristic: episodeAndCharacter.characters.type),
                            CharacterInfo.init(characteristicName: "Location", characteristic: episodeAndCharacter.characters.location.name)]
        tableView.reloadData()
    }
}

extension CharacterDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = characterDetails[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailsTableViewCell.identifier, for: indexPath) as? CharacterDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
}
