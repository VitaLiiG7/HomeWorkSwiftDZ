
import UIKit

class ViewController: UIViewController {
    
    var imagesArray = [UIImage.init(named: "blueCar"), UIImage.init(named: "bridge"), UIImage.init(named: "butterfly"), UIImage.init(named: "cat"), UIImage.init(named: "city"), UIImage.init(named: "leopard"), UIImage.init(named: "mountain"), UIImage.init(named: "ocean"), UIImage.init(named: "raspberry"), UIImage.init(named: "redCar")]
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var currentindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureImageView?.image = .blueCar
    }
    
    @IBAction func returnsPreviousImageAction(_ sender: Any) {
        if currentindex >= 1 {
            currentindex -= 1
            pictureImageView.image = imagesArray[currentindex % imagesArray.count]
        } else {
            return
        }
    }
    
    @IBAction func showsFollowingImageAction(_ sender: Any) {
        if currentindex <= 9 {
            currentindex += 1
            pictureImageView.image = imagesArray[currentindex % imagesArray.count]
        } else {
            return
        }
    }
}
