
import UIKit

class segmentSelectionViewController: UIViewController {
   
    @IBOutlet weak var changeViewSegmentControl: UISegmentedControl!
    
     private lazy var firstTextField: UITextField = {
        let oneTextField = UITextField()
         oneTextField.placeholder = "text 1"
         oneTextField.backgroundColor = .white
         oneTextField.frame = CGRect(x: 16, y: 100, width: 100, height: 50)
         return oneTextField
    }()
    
    private lazy var secondTextField: UITextField = {
       let twoTextField = UITextField()
        twoTextField.placeholder = "text 2"
        twoTextField.backgroundColor = .white
        twoTextField.frame = CGRect(x: 16, y: 200, width: 100, height: 50)
        return twoTextField
   }()
    
    private lazy var firstButton: UIButton = {
        let oneButton = UIButton()
        oneButton.setTitle("ButtenOne", for: .normal)
        oneButton.frame = CGRect(x: 16, y: 100, width: 100, height: 50)
        oneButton.backgroundColor = .green
        return oneButton
    }()
    
    private lazy var secondButten: UIButton = {
        let twoButten = UIButton()
        twoButten.setTitle("ButtenTwo", for: .normal)
        twoButten.frame = CGRect(x: 16, y: 200, width: 100, height: 50)
        twoButten.backgroundColor = .green
        return twoButten
    }()
    
    private lazy var firstImageView: UIImageView = {
        let oneImage = UIImageView()
        oneImage.frame = CGRect(x: 16, y: 50, width: 120, height: 200)
        oneImage.image = .city
        oneImage.contentMode = .scaleAspectFit
        return oneImage
    }()
    
    private lazy var secondImage: UIImageView = {
        let twoImage = UIImageView()
        twoImage.frame = CGRect(x: 150, y: 50, width: 120, height: 200)
        twoImage.image = .blueCar
        twoImage.contentMode = .scaleAspectFit
        return twoImage
    }()
    
    @IBOutlet weak var imageView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        imageView.addSubview(firstButton)
        imageView.addSubview(secondButten)
        imageView.backgroundColor = .green
        imageView.addSubview(firstTextField)
        imageView.addSubview(secondTextField)
        imageView.addSubview(firstImageView)
        imageView.addSubview(secondImage)
        firstButton.isHidden = true
        secondButten.isHidden = true
        firstImageView.isHidden = true
        secondImage.isHidden = true
    }
    
    @IBAction func changingSegmentAction(_ sender: Any) {
        
        switch changeViewSegmentControl?.selectedSegmentIndex {
        case 0:
            imageView.backgroundColor = .green
            firstTextField.isHidden = false
            secondTextField.isHidden = false
            firstButton.isHidden = true
            secondButten.isHidden = true
            firstImageView.isHidden = true
            secondImage.isHidden = true
        case 1:
            imageView.backgroundColor = .blue
            firstTextField.isHidden = true
            secondTextField.isHidden = true
            firstButton.isHidden = false
            secondButten.isHidden = false
            firstImageView.isHidden = true
            secondImage.isHidden = true
        case 2:
            imageView.backgroundColor = .purple
            firstTextField.isHidden = true
            secondTextField.isHidden = true
            firstButton.isHidden = true
            secondButten.isHidden = true
            firstImageView.isHidden = false
            secondImage.isHidden = false
            
        default:
            break
        }
    }
}

