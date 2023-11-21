
import UIKit

final class ScrollViewController: UIViewController {
    
    private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 2)
    
    private var rubleChar: Character = "\u{20BD}"
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.bounces = true
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.contentSize = contentViewSize
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.frame.size = contentViewSize
        return containerView
    }()
    
    private lazy var burgerImageView: UIImageView = { 
        let burgerImageView = UIImageView()
        burgerImageView.image = UIImage(named: "burger")
        burgerImageView.clipsToBounds = true
        burgerImageView.contentMode = .scaleAspectFit
        return burgerImageView
    }()
    
    private lazy var nameOfOgranizationLabel: UILabel = {
        let nameOfOgranizationLabel = UILabel()
        nameOfOgranizationLabel.text = "Бургерная ДЖО"
        nameOfOgranizationLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        nameOfOgranizationLabel.textColor = .black
        nameOfOgranizationLabel.numberOfLines = 0
        nameOfOgranizationLabel.textAlignment = .center
        return nameOfOgranizationLabel
    }()
    
    private lazy var nameOfTheKitchenLabel: UILabel = {
        let nameOfOgranizationLabel = UILabel()
        nameOfOgranizationLabel.text = "Американская кухня"
        nameOfOgranizationLabel.font = UIFont(name: "Times New Roman", size: 18.0)
        nameOfOgranizationLabel.textColor = .systemGray
        nameOfOgranizationLabel.numberOfLines = 0
        nameOfOgranizationLabel.textAlignment = .center
        return nameOfOgranizationLabel
    }()
    
    private lazy var nameInformationDiscountLabel: UILabel = {
        let nameInformationDiscountLabel = UILabel()
        nameInformationDiscountLabel.text = "Ваша скидка 20%"
        nameInformationDiscountLabel.font = UIFont(name: "Times New Roman", size: 18)
        nameInformationDiscountLabel.textColor = .black
        nameInformationDiscountLabel.numberOfLines = 0
        nameInformationDiscountLabel.textAlignment = .justified
        return nameInformationDiscountLabel
    }()
    
    private lazy var nameIngredientLabel: UILabel = {
        let nameIngredientLabel = UILabel()
        nameIngredientLabel.text = "Что нужно для того, чтобы приготовить самые вкусные бургеры? Сперва, это качественные ингредиенты."
        nameIngredientLabel.font = UIFont(name: "Times New Roman", size: 21.0)
        nameIngredientLabel.textColor = .black
        nameIngredientLabel.numberOfLines = 0
        nameIngredientLabel.textAlignment = .justified
        return nameIngredientLabel
    }()
    
    private lazy var menuSelectionButton: UIButton = {
        let menuSelectionButton = UIButton()
        menuSelectionButton.setTitle("МЕНЮ", for: .normal)
        menuSelectionButton.layer.borderWidth = 2.0
        menuSelectionButton.layer.borderColor = UIColor.systemGreen.cgColor
        menuSelectionButton.backgroundColor = .white
        menuSelectionButton.layer.cornerRadius = 10
        menuSelectionButton.setTitleColor(UIColor .systemGreen, for: .normal)
        return menuSelectionButton
    }()
    
    private lazy var mapImageView: UIImageView = { 
        let mapImageView = UIImageView()
        mapImageView.image = UIImage(named: "imageVologda")
        mapImageView.clipsToBounds = true
        mapImageView.contentMode = .scaleAspectFit
        return mapImageView
    }()
    
    private lazy var nameDepositlabel: UILabel = {
        let nameDepositLabel = UILabel()
        nameDepositLabel.text = "Депозит составлят 100 \(rubleChar). При отмене брони, менее чем за 2 часа депозит удерживается"
        nameDepositLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        nameDepositLabel.textColor = .systemGray2
        nameDepositLabel.numberOfLines = 0
        nameDepositLabel.textAlignment = .center
        return nameDepositLabel
    }()
    
    private lazy var createAnEventButton: UIButton = {
        let createAnEventButton = UIButton()
        createAnEventButton.setTitle("СОЗДАТЬ СОБЫТИЕ", for: .normal)
        createAnEventButton.backgroundColor = .systemGreen
        createAnEventButton.titleLabel?.textColor = .white
        createAnEventButton.layer.cornerRadius = 10
        return createAnEventButton
    }()
    
    private lazy var ordeToTakeAwayButton: UIButton = {
        let ordeToTakeAwayButton = UIButton()
        ordeToTakeAwayButton.setTitle("ЗАКАЗАТЬ НА ВЫНОС", for: .normal)
        ordeToTakeAwayButton.layer.borderWidth = 2.0
        ordeToTakeAwayButton.layer.borderColor = UIColor.systemGreen.cgColor
        ordeToTakeAwayButton.backgroundColor = .white
        ordeToTakeAwayButton.setTitleColor(UIColor .systemGreen, for: .normal)
        ordeToTakeAwayButton.layer.cornerRadius = 10
        return ordeToTakeAwayButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(containerView)
        [burgerImageView, nameOfOgranizationLabel, nameOfTheKitchenLabel, nameInformationDiscountLabel, nameIngredientLabel, menuSelectionButton, mapImageView, nameDepositlabel, createAnEventButton, ordeToTakeAwayButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nameDepositlabel.topAnchor.constraint(equalTo: mapImageView.bottomAnchor, constant: -20),
            nameDepositlabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameDepositlabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            nameOfOgranizationLabel.topAnchor.constraint(equalTo: burgerImageView.bottomAnchor, constant: 10),
            nameOfOgranizationLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameOfOgranizationLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            nameOfTheKitchenLabel.topAnchor.constraint(equalTo: nameOfOgranizationLabel.bottomAnchor, constant: 10),
            nameOfTheKitchenLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameOfTheKitchenLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            nameInformationDiscountLabel.topAnchor.constraint(equalTo: nameOfTheKitchenLabel.bottomAnchor, constant: 10),
            nameInformationDiscountLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameInformationDiscountLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            nameInformationDiscountLabel.heightAnchor.constraint(equalToConstant: 50),
            nameIngredientLabel.topAnchor.constraint(equalTo: nameInformationDiscountLabel.bottomAnchor, constant: -5),
            nameIngredientLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameIngredientLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)])
        setupMainInfoConstraints()
    }
    
    private func setupMainInfoConstraints() {
        NSLayoutConstraint.activate([
            burgerImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -40),
            burgerImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            burgerImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            burgerImageView.heightAnchor.constraint(equalToConstant: 230),
            mapImageView.topAnchor.constraint(equalTo: menuSelectionButton.bottomAnchor, constant: -20),
            mapImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            mapImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            mapImageView.heightAnchor.constraint(equalToConstant: 280),
            menuSelectionButton.topAnchor.constraint(equalTo: nameIngredientLabel.bottomAnchor, constant: 20),
            menuSelectionButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            menuSelectionButton.heightAnchor.constraint(equalToConstant: 50),
            menuSelectionButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            createAnEventButton.topAnchor.constraint(equalTo: nameDepositlabel.bottomAnchor, constant: 20),
            createAnEventButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            createAnEventButton.heightAnchor.constraint(equalToConstant: 50),
            createAnEventButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            ordeToTakeAwayButton.topAnchor.constraint(equalTo: createAnEventButton.bottomAnchor, constant: 10),
            ordeToTakeAwayButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            ordeToTakeAwayButton.heightAnchor.constraint(equalToConstant: 50),
            ordeToTakeAwayButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20)])
    }
}
