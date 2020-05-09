//
//  CreateAccountController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 22/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth


class CreateAccountController: UIViewController, UITextFieldDelegate , UIViewControllerTransitioningDelegate {
    
    
var isPressed = false
var isntPressed = false
    
    
var errorLabel: UILabel = {
let label = UILabel()
label.textColor = .red
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 14)
 
return label
        
}()
    
lazy var createAccountButtom: UIButton = {
let button = UIButton()
button.setTitle("Create account", for: .normal)
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.addTarget(self, action: #selector(createUser), for: .touchUpInside)
return button
}()

    
let acceptButton: UIButton = {
let button = UIButton()
button.layer.cornerRadius = 5
button.layer.borderColor = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1).cgColor
button.addTarget(self, action: #selector(toggleSender), for: .touchUpInside)
button.layer.borderWidth = 2
return button
}()
    
let acceptSecond: UIButton = {
let button = UIButton()
button.layer.cornerRadius = 5
button.layer.borderColor = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1).cgColor
button.addTarget(self, action: #selector(toggleSecondSender), for: .touchUpInside)
button.layer.borderWidth = 2
return button
}()
    
let emailTextfield: UITextField = {
let textField = UITextField()
textField.textAlignment = .center
textField.placeholder = "Mail"
textField.textContentType = .username
textField.clearButtonMode = .whileEditing
return textField
}()
    
let passwordTextField: UITextField = {
let textField = UITextField()
textField.placeholder = "Password"
textField.textAlignment = .center
textField.textContentType = .password
textField.clearButtonMode = .whileEditing
textField.isSecureTextEntry = true
return textField
}()
    
let passwordConfirmField: UITextField = {
let textField = UITextField()
textField.placeholder = "Password confirmation"
textField.textAlignment = .center
textField.textContentType = .password
textField.clearButtonMode = .whileEditing
textField.isSecureTextEntry = true
return textField
}()


    
    
let createAccountLbl: UILabel = {
let label = UILabel()
label.text = "or create account"
label.textAlignment = .center
label.textColor = .black
return label
}()
    
    
    
var customFbButton: UIButton = {
let button = UIButton()
button.setTitle("Register with facebook", for: .normal)
button.titleLabel?.tintColor = .white
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
button.backgroundColor = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
button.addTarget(self, action: #selector(faceLogIn), for: .touchUpInside)
return button
}()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        setupAllViews()
        
        
       
     
    }
    

   

    
func setupTexFieldsDelegates() {
    self.emailTextfield.delegate = self
    self.passwordTextField.delegate = self
    self.passwordConfirmField.delegate = self
    
    
}
    
 

    
func setupAllViews() {
    
    view.backgroundColor = .white
    navigationItem.title = "Create Account"
    setupFacebookRegister()
    setupViews()
    setupResigners()
    setupBottomItems()
    setupBottomText()
    setupTexFieldsDelegates()
   
        
        
}
    
func pushFromRight() -> CATransition {
let caTransition = CATransition()
caTransition.duration = 0.35
caTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
caTransition.type = CATransitionType.reveal
caTransition.subtype = CATransitionSubtype.fromRight
return caTransition
}



    
func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
    
self.view.subviews.forEach { (selectedView) in
if selectedView.transform != .identity {
selectedView.transform = .identity
self.errorLabel.removeFromSuperview()
return
}

}   
return true

}
    
    
    
    
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        return
    }
    
func setupResigners() {
    
let views = [emailTextfield,passwordConfirmField,passwordTextField]
    
for view in views {
    
view.resignFirstResponder()
        
}

}

    
    
func setupFacebookRegister() {
    
let fbLogoView = UIImageView(image: #imageLiteral(resourceName: "facebook").withRenderingMode(.alwaysTemplate))
fbLogoView.contentMode = .scaleAspectFill
fbLogoView.layer.cornerRadius = 0
fbLogoView.tintColor = .white


view.addSubview(customFbButton)
customFbButton.addSubview(fbLogoView)
    
customFbButton.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingbottom: 0, paddingLeft: 8, paddingRight: 8, widht: 0, height: 40)
customFbButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
fbLogoView.setAutoLayout(top: customFbButton.topAnchor, bottom: customFbButton.bottomAnchor, left: customFbButton.leftAnchor, right: nil, paddingTop: 2, paddingbottom: 2, paddingLeft: 64, paddingRight: 0, widht: 20, height: 0)
  
}
    

    

    
@objc func faceLogIn() {
    
if isPressed != true {
        
addErrorLabel()
        
self.errorLabel.text = "Please accept our data protection regulations."
  
return

}

errorLabel.removeFromSuperview()

let readPermissions = ["email", "public_profile"]
    
    FBSDKLoginManager().logIn(withReadPermissions: readPermissions, from: self) { (result, error) in
    if let error = error {
    print(error.localizedDescription)
        
        
    }

    
   
    if result?.isCancelled ?? true {
        
    self.customFbButton.transform = CGAffineTransform(translationX: 0, y: 40)
    self.addErrorLabel()
    self.errorLabel.text = "Connected to facebook has been aborted"

    return
  
   }
    
    if FBSDKAccessToken.current() != nil {
        
    let vc = HomeController()
    self.present(vc, animated: true, completion: nil)
    }
        
    
     
    
    self.getMailFromUser()
    
   
 
    
}

}
    
func getMailFromUser () {

    FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name , email, "])?.start(completionHandler: { (connection, result, error) in
    if let err = error {
        
    print(err.localizedDescription)
       
    return
    }
    
    print(result ?? "")
        
        
        
    })
    
}
    

func setupViews() {
    
view.addSubview(createAccountLbl)
    
createAccountLbl.setAutoLayout(top: customFbButton.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 28, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 140, height: 20)
    
createAccountLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

let stackView = UIStackView(arrangedSubviews: [emailTextfield,passwordTextField,passwordConfirmField])
    
stackView.distribution = .fillEqually
stackView.axis = .vertical
stackView.spacing = 10
    
    
view.addSubview(stackView)
stackView.setAutoLayout(top: createAccountLbl.bottomAnchor, bottom: nil, left: customFbButton.leftAnchor, right: customFbButton.rightAnchor, paddingTop: 28, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 130)
    
for view in stackView.arrangedSubviews {
    
let separatorView = UIView()
separatorView.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)

view.addSubview(separatorView)
    
separatorView.setAutoLayout(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0.5)
    
    
        
}
}

func setupBottomItems() {
    
let stackView = UIStackView(arrangedSubviews: [acceptButton,acceptSecond])
    
stackView.distribution = .fillEqually
stackView.axis = .vertical
stackView.spacing = 22
    
view.addSubview(stackView)
    
stackView.setAutoLayout(top: passwordConfirmField.bottomAnchor, bottom: nil, left: passwordConfirmField.leftAnchor, right: nil, paddingTop: 18, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 36, height: 100)

        
        

    
}
    
    
@objc func toggleSender(sender: UIButton) {
    
checkIfPressed(bool: !isPressed)
  
}
    
func checkIfPressed(bool: Bool) {
isPressed = bool
let checkedImage = isPressed ? UIImage(named: "check") : UIImage(named: "")
acceptButton.setImage(checkedImage, for: .normal)


}
    
@objc func secondChecked(bool: Bool) {
isntPressed = bool
let secondChecked = isntPressed ? UIImage(named: "check") : UIImage(named: "")
acceptSecond.setImage(secondChecked, for: .normal)
        

}
    
@objc func toggleSecondSender(sender: UIButton) {
secondChecked(bool: !isntPressed)
}

func setupBottomText() {

let termsLabel = UILabel()
termsLabel.font = UIFont.systemFont(ofSize: 11)
termsLabel.numberOfLines = 0
    
let notificationsLabel = UILabel()
notificationsLabel.font = UIFont.systemFont(ofSize: 11)
notificationsLabel.numberOfLines = 0

    

let string = NSMutableAttributedString(string: "I accept the terms of service and the data protection regulations and confirm to be at least 16 years of age")
string.setColorForText(textForAttribute: "terms of service", withColor: UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1))
string.setColorForText(textForAttribute: "data protection regulations", withColor: UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1))
termsLabel.attributedText = string

    
let notificationString = NSMutableAttributedString(string: "I want to receive notifications about special offers and free gifts at my preferred stores.(Declaration of conset)")
notificationString.setColorForText(textForAttribute: "Declaration of conset", withColor: UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1))
notificationsLabel.attributedText = notificationString


    
view.addSubview(termsLabel)
view.addSubview(notificationsLabel)
view.addSubview(createAccountButtom)
    
termsLabel.setAutoLayout(top: nil, bottom: nil, left: acceptButton.rightAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 20, paddingRight: 0, widht: 0, height: 40)
    
termsLabel.centerYAnchor.constraint(equalTo: acceptButton.centerYAnchor).isActive = true
    
    
notificationsLabel.setAutoLayout(top: nil, bottom: nil, left: acceptSecond.rightAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 20, paddingRight: 10, widht: 0, height: 40)
    
notificationsLabel.centerYAnchor.constraint(equalTo: acceptSecond.centerYAnchor).isActive = true
    
createAccountButtom.setAutoLayout(top: notificationsLabel.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingbottom: 0, paddingLeft: 8, paddingRight: 8, widht: 0, height: 40)

createAccountButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    
   
        
   
}
    
func addErrorLabel() {

self.view.subviews.forEach { (selectedView) in
    
selectedView.transform = CGAffineTransform(translationX: 0, y: 40)
   
selectedView.addSubview(errorLabel)
errorLabel.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -12, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
return
}
    

    
}
    
let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

    
@objc func createUser() {
    
    print("tapped")
    
guard let emailText = emailTextfield.text else { return }
guard let passwordText = passwordTextField.text else { return }
guard let passwordConfirm = passwordConfirmField.text else { return }
    
if passwordText != passwordConfirm  && emailText == "" {
        
self.addErrorLabel()

return self.errorLabel.text =  LoginError.emptyField.desc


}

else if emailText != "" && passwordConfirm == "" && passwordText == "" {

self.addErrorLabel()
return self.errorLabel.text = LoginError.passDontMatch.desc



}

else if emailText != "" && passwordConfirm == passwordText && isPressed == false {
    
self.addErrorLabel()
return self.errorLabel.text = LoginError.didntAcceptTerms.desc

    
}
else if emailText == "" {
self.addErrorLabel()
return self.errorLabel.text = LoginError.emptyField.desc
    
    
}
else if emailText != "" && passwordConfirm != passwordText {
self.addErrorLabel()
return self.errorLabel.text = LoginError.passDontMatch.desc


} else {
    
activityIndicator.center = view.center
view.addSubview(activityIndicator)
activityIndicator.color = .black
activityIndicator.startAnimating()
view.backgroundColor = UIColor.init(white: 1.6, alpha: 0.5)
    
Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user, error) in
    
    
    self.createAccountButtom.isEnabled = true
    
   if  error != nil {
    
    self.activityIndicator.stopAnimating()
    self.addErrorLabel()
    self.view.backgroundColor = .white
    return self.errorLabel.text = LoginError.error.desc
    }
    
    
    self.activityIndicator.isHidden = true
    self.view.backgroundColor = .white
    self.sendVerificationMail()
    self.showAlert()
    
    
    
    
}
}

}
    
 func sendVerificationMail() {
if Auth.auth().currentUser != nil && !Auth.auth().currentUser!.isEmailVerified {
Auth.auth().currentUser!.sendEmailVerification(completion: { (error) in
})
}
else {
}
}

func showAlert() {
    
let alertViewController = UIAlertController(title: "A confirmation mail has been send to you", message: "", preferredStyle: .alert)

    
let action = UIAlertAction(title: "Ok", style: .default) { (_) in
    
    DispatchQueue.main.async {
       
//      self.view.layer.add(self.pushFromRight(), forKey: nil)
        self.navigationController?.pushViewController(HomeController(), animated: true)
       
    }
    

}
    
alertViewController.addAction(action)
self.present(alertViewController, animated: true, completion: nil)
    
        
}
    
 
    


}
    
  

    


