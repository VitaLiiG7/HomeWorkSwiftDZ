
import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    private var priceNameLabel: UILabel = {
       let priceNameLabel = UILabel()
        priceNameLabel.textColor = .systemRed
        return priceNameLabel
    }()
    
    private var discountNameLabel: UILabel = {
       let discountNameLabel = UILabel()
        discountNameLabel.textColor = .white
        discountNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        discountNameLabel.textAlignment = .center
        discountNameLabel.backgroundColor = .red
        return discountNameLabel
    }()
    
    private var clothingNameLabel: UILabel = {
       let clothingNameLabel = UILabel()
        clothingNameLabel.textColor = .systemGray
        clothingNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        clothingNameLabel.textAlignment = .center
        return clothingNameLabel
    }()
    
    private var priceWithoutDiscountLabel: UILabel = {
       let priceWithoutDiscountLabel = UILabel()
        priceWithoutDiscountLabel.textColor = .black
        priceWithoutDiscountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        priceWithoutDiscountLabel.textAlignment = .center
        priceWithoutDiscountLabel.attributedText = NSAttributedString(string: "123", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        return priceWithoutDiscountLabel
    }()
                                                                      
    func configure(model: Photo) {
        contentView.addSubview(imageView)
        contentView.addSubview(priceNameLabel)
        contentView.addSubview(discountNameLabel)
        contentView.addSubview(priceWithoutDiscountLabel)
        contentView.addSubview(clothingNameLabel)
        imageView.image = UIImage(named: model.imageName)
        priceNameLabel.text = model.price
        discountNameLabel.text = model.discount
        priceWithoutDiscountLabel.text = model.priceWithoutDiscount
        clothingNameLabel.text = model.clothingNameLabel
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        priceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        discountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceWithoutDiscountLabel.translatesAutoresizingMaskIntoConstraints = false
        clothingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            priceNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 200),
            priceNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        NSLayoutConstraint.activate([
            discountNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            discountNameLabel.heightAnchor.constraint(equalToConstant: 25),
            discountNameLabel.widthAnchor.constraint(equalToConstant: 25),
            priceWithoutDiscountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceWithoutDiscountLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            clothingNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            clothingNameLabel.topAnchor.constraint(equalTo: priceNameLabel.bottomAnchor, constant: -20)])
    }
}
