
import UIKit

class ImageViewController: UIViewController {
    
    var nameLabelArray = ["Label 1", "Label 2", "Label 3", "Label 4", "Label 5", "Label 6", "Label 7", "Label 8", "Label 9", "Label 10"]
    
    @IBOutlet weak var imagesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        let screenWidth = Double(self.view.frame.size.width)
        let imageWidth = screenWidth / 2 - 20
        let imageHeight = imageWidth
        
        var imageCoordinateX = 0
        var imageCoordinateY = 0
        var stepY = 0
        var definitionOfPositonImage = 0
        
        for index in 0..<imagesArray.count  {
            if index > 3 {
                break
            }
            if index % 2 == 0 && definitionOfPositonImage % 2 == 0 {
                imageCoordinateX = 15
                stepY += 1
            } else {
                imageCoordinateX = 220
            }
            definitionOfPositonImage += 1
            imageCoordinateY = stepY * 170
            
            let imageView = UIImageView()
            imageView.image = imagesArray[index]
            let nameLabel = UILabel()
            nameLabel.text = nameLabelArray[index]
            
            if index == 0 || index == 1 {
                
                imageView.frame = CGRect(x: imageCoordinateX, y: 100, width: Int(imageWidth), height: Int(imageHeight))
                nameLabel.frame = CGRect(x: imageCoordinateX, y: 200, width: Int(imageWidth), height: Int(imageHeight))
            } else {
                imageView.frame = CGRect(x: imageCoordinateX, y: imageCoordinateY, width: Int(imageWidth), height: Int(imageHeight))
                nameLabel.frame = CGRect(x: imageCoordinateX, y: imageCoordinateY + 100, width: Int(imageWidth), height: Int(imageHeight))
            }
            view.addSubview(imageView)
            view.addSubview(nameLabel)
        }
    }
}
        


    
