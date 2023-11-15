
import UIKit

var imagesArray = [UIImage.init(named: "blueCar"), UIImage.init(named: "bridge"), UIImage.init(named: "butterfly"), UIImage.init(named: "cat"), UIImage.init(named: "city"), UIImage.init(named: "leopard"), UIImage.init(named: "mountain"), UIImage.init(named: "ocean"), UIImage.init(named: "raspberry"), UIImage.init(named: "redCar")]

class ViewController: UIViewController {
    
    @IBOutlet weak var picturesView: UIImageView!
    
    var currentindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picturesView?.image = .blueCar
    }
    
    @IBAction func returnsPreviousImageAction(_ sender: Any) {
        if currentindex >= 1 {
            currentindex -= 1
            picturesView.image = imagesArray[currentindex % imagesArray.count]
        } else {
            return
        }
    }
    
    @IBAction func showsFollowingImageAction(_ sender: Any) {
        if currentindex <= 9 {
            currentindex += 1
            picturesView.image = imagesArray[currentindex % imagesArray.count]
        } else {
            return
        }
    }
}
