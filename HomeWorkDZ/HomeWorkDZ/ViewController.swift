
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nameLabel: UILabel!
    let screenSize:CGRect = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var count = 0
    
    @IBAction func collapsingUnfoldingTextButton(_ sender: Any) {
    
        count += 1
        
        if count % 2 != 0 {
            nameLabel.numberOfLines = 1
            heightConstraint.constant = 0
            view.layoutIfNeeded()
            
        } else {
            nameLabel.numberOfLines += 4
            heightConstraint.constant = 150
            view.layoutIfNeeded()
        }
    }
}

