

import UIKit

class RegisterController: UIViewController {
    
let separatorView: UIView = {
let view = UIView()
view.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
return view
        
        
}()
    

    
let wrongNumberLabel: UILabel = {
let label = UILabel()
label.text = "Your number code is invalid."
label.textColor = .red
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 14)
return label
}()
    

lazy var clearTextButton: UIButton = {
let button = UIButton(type: .system)
button.setImage(#imageLiteral(resourceName: "clearText"), for: .normal)
button.tintColor = .gray
button.alpha = 0.4
button.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
return button
        
}()

    
    
    
let createAccButton: UIButton = {
let button = UIButton(type: .system)
button.setTitle("Create account", for: .normal)
button.tintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.layer.cornerRadius = 5
button.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
button.addTarget(self, action: #selector(pushCreateAcount), for: .touchUpInside)
button.layer.borderWidth = 1
return button

}()
   
let newStampay: UILabel = {
let label = UILabel()
label.text = "New to stampay?"
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 18)
label.textColor = .black
return label
}()
    
let orLabel: UILabel = {
let label = UILabel()
label.text = "or"
return label
        

}()
    
let ownCardLabel: UILabel = {
let label = UILabel()
label.text = "Already own a card?"
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 18)
label.textColor = .black
return label
}()

lazy var numberTextField: UITextField = {
let textField = UITextField()
textField.attributedPlaceholder = NSAttributedString(string: "Your numbercode")
textField.font = UIFont.systemFont(ofSize: 16)
textField.textAlignment = .center
textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
textField.keyboardType = .asciiCapableNumberPad
return textField
}()
    
    
lazy var scanButton: UIButton = {
let button = UIButton(type: .system)
button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.setTitle("Scan card", for: .normal)
button.tintColor = .white
button.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
button.addTarget(self, action: #selector(showCamera), for: .touchUpInside)
return button
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllViews()

        
        
    }
    
    
func setupAllViews() {
view.backgroundColor = .white
setupNavigationController()
setupStackView()
self.numberTextField.resignFirstResponder()
setupCreateAccount()
    
    


}
        
    
    
    
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    return
}
    
    func setupNavigationController() {
        
self.navigationController?.isNavigationBarHidden = false
self.navigationItem.title = "Register"
self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
  
}
    

    

    
    
    func setupStackView() {
        
  
        
    let stackView = UIStackView(arrangedSubviews: [ownCardLabel,numberTextField,scanButton])
    stackView.distribution = .fillEqually
    stackView.axis = .vertical
    stackView.spacing = 12
   
    view.addSubview(stackView)
        
    stackView.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingbottom: 0, paddingLeft: 20, paddingRight: 20, widht: 0, height: 150)
        
    ownCardLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: -20).isActive = true
        
    view.addSubview(separatorView)
    separatorView.setAutoLayout(top: nil, bottom: numberTextField.bottomAnchor, left: scanButton.leftAnchor, right: scanButton.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0.5)

        
        
    }
    
// Das konnte ich schon mit texfield.clearButtonMode = .clearWhileEditing aber ich wollte euch so programmatically zeigen
    
    
    @objc func handleTextChange() {
      
    let isFormValid = numberTextField.text?.count ?? 0 > 0
        
    if isFormValid {
  

    self.clearTextButton.addTarget(self, action: #selector(clearData), for: .touchUpInside)
    self.scanButton.setTitle("Next", for: .normal)
    addClearTextButton()
    } else {
    
    removeClearTextButton()
    self.scanButton.setTitle("Scan card", for: .normal)
    }
    }
    
    
    
    @objc func clearData() {
    
    self.numberTextField.text = ""
    handleTextChange()
        
    }
    
    
    func addClearTextButton () {
        
    view.addSubview(clearTextButton)
     
    clearTextButton.setAutoLayout(top: nil, bottom: numberTextField.bottomAnchor, left: numberTextField.rightAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 10, paddingLeft: 0, paddingRight: 30, widht: 16, height: 14)

    }
    
    func removeClearTextButton() {
        
    self.clearTextButton.removeFromSuperview()
        
        
    }
    
    
    func performAnimation() {
     

        
    self.scanButton.transform = CGAffineTransform(translationX: 0, y: 30)
    self.separatorView.transform = CGAffineTransform(translationX: 0, y: 30)
    self.numberTextField.transform = CGAffineTransform(translationX: 0, y: 30)
    self.clearTextButton.isHidden = true
        
    addWrongNumberLabel()

    
 
    }
    
    
    
    var gesture: UITapGestureRecognizer!
    func addWrongNumberLabel() {
        
    view.addSubview(wrongNumberLabel)
        
    wrongNumberLabel.setAutoLayout(top: numberTextField.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: -12, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 220, height: 30)
    wrongNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    gesture = UITapGestureRecognizer(target: self, action: #selector(handleTextGesture))
    self.numberTextField.addGestureRecognizer(gesture)
  

        
        
    }
    
    @objc func handleTextGesture() {
        
    self.wrongNumberLabel.removeFromSuperview()
    self.scanButton.transform = .identity
    self.separatorView.transform = .identity
    self.numberTextField.transform = .identity
    self.clearTextButton.isHidden = false
    self.numberTextField.removeGestureRecognizer(gesture)
        
        
    }
    
    
    
    
    
    
    @objc func showCamera(sender: UIButton) {
        
    switch sender.currentTitle {
    case "Next":
    
    performAnimation()

    case "Scan card":

    let vc = CameraController()

    DispatchQueue.main.async {
    self.present(vc, animated: true, completion: nil)

    }


    default:
    print("Default")
    }
        
    }
    
    
    
    
    func setupCreateAccount() {
       
    view.addSubview(orLabel)
    
    orLabel.setAutoLayout(top: nil, bottom: nil, left: nil, right: nil, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 20, height: 20)
        
    orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    orLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        
        
    let stackView = UIStackView(arrangedSubviews: [newStampay,createAccButton])
        
    stackView.distribution = .fillEqually
    stackView.axis = .vertical
    stackView.spacing = 10
        
    view.addSubview(stackView)
    stackView.setAutoLayout(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 50, paddingRight: 50, widht: 0, height: 90)
        
        
        
    }
    
    @objc func pushCreateAcount() {
        
    let controller = CreateAccountController()
        
    self.navigationController?.pushViewController(controller, animated: true)
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
    
        
    }
    
    
}
