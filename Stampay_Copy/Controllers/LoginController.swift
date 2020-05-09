//
//  LoginController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 25/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class LoginController: UIViewController, UITextFieldDelegate {
    
    
var errorLabel: UILabel = {
let label = UILabel()
label.textColor = .red
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 14)
        
return label
        
}()
    
    
var customFbButton: UIButton = {
let button = UIButton()
button.setTitle("Login with facebook", for: .normal)
button.titleLabel?.tintColor = .white
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
button.backgroundColor = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
button.addTarget(self, action: #selector(faceLogIn), for: .touchUpInside)
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
    
lazy var loginButton: UIButton = {
let button = UIButton()
button.setTitle("Login", for: .normal)
button.titleLabel?.textColor = .white
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
       setupAllLoginViews()
    }
    
    
func setupAllLoginViews() {
        
        
navigationItem.title = "Login"
view.backgroundColor = .white
setupNav()
setupTextFieldDelegates()
setupFaceButton()
setupStackView()
setupResigners()
}
    
func setupNav() {
        
self.navigationController?.isNavigationBarHidden = false
self.navigationItem.title = "Login"
self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    }
    
func setupFaceButton (){
    
let fbLogoView = UIImageView(image: #imageLiteral(resourceName: "facebook").withRenderingMode(.alwaysTemplate))
fbLogoView.contentMode = .scaleAspectFill
fbLogoView.layer.cornerRadius = 0
fbLogoView.tintColor = .white

view.addSubview(customFbButton)
customFbButton.addSubview(fbLogoView)
    
customFbButton.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingbottom: 0, paddingLeft: 40, paddingRight: 40, widht: 0, height: 40)
customFbButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
fbLogoView.setAutoLayout(top: customFbButton.topAnchor, bottom: customFbButton.bottomAnchor, left: customFbButton.leftAnchor, right: nil, paddingTop: 2, paddingbottom: 2, paddingLeft: 44, paddingRight: 0, widht: 20, height: 0)
        
}
    
func setupResigners() {
        
let views = [emailTextfield,passwordTextField]
        
for view in views {
            
view.resignFirstResponder()
    
}
}

func setupTextFieldDelegates() {
emailTextfield.delegate = self
passwordTextField.delegate = self
        
}
    
func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
self.stackView.arrangedSubviews.forEach { (selectedView) in
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
    
func pushFromTop() -> CATransition {
let caTransition = CATransition()
caTransition.duration = 0.25
caTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
caTransition.type = CATransitionType.reveal
caTransition.subtype = CATransitionSubtype.fromTop
return caTransition
}

    

    
var stackView: UIStackView!
func setupStackView() {
    
stackView = UIStackView(arrangedSubviews: [emailTextfield,passwordTextField,loginButton])
    
stackView.distribution = .fillEqually
stackView.axis = .vertical
stackView.spacing = 10
    
view.addSubview(stackView)
    
for view in stackView.arrangedSubviews {
    
let separatorView = UIView()
separatorView.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
view.addSubview(separatorView)
separatorView.setAutoLayout(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0.5)
        
}
    
stackView.setAutoLayout(top: customFbButton.bottomAnchor, bottom: nil, left: customFbButton.leftAnchor, right: customFbButton.rightAnchor, paddingTop: 8, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 140)
        

}
    
@objc func faceLogIn() {
    

        
let readPermissions = ["email", "public_profile"]
        
FBSDKLoginManager().logIn(withReadPermissions: readPermissions, from: self) { (result, error) in
    if let error = error {
    print(error.localizedDescription)
}
if result?.isCancelled ?? true {
                
self.addErrorLabel()
self.errorLabel.text = "Connected to facebook has been aborted"
        
return
}
            
if FBSDKAccessToken.current() != nil {
    
self.errorLabel.removeFromSuperview()
let vc = MainTabBarController()
self.present(vc, animated: true, completion: nil)
}
}
        
}
    
let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
@objc func logIn() {
    
print("tapped")
    
activityIndicator.center = view.center
view.addSubview(activityIndicator)
activityIndicator.color = .black
activityIndicator.startAnimating()
view.backgroundColor = UIColor.init(white: 1.6, alpha: 0.5)

    
    
    guard let email = emailTextfield.text else { return }
    guard let password = passwordTextField.text else { return }
  
    
    
        
    Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
   
    
    if email == "" && password == "" {
        
    self.activityIndicator.stopAnimating()
    self.addErrorLabel()
    self.view.backgroundColor = .white
    self.errorLabel.text = LoginError.emailOrPassword.desc
    }
        
    if error != nil {
    self.activityIndicator.stopAnimating()
    self.addErrorLabel()
    self.view.backgroundColor = .white
    self.errorLabel.text = LoginError.emailOrPassword.desc
    }
    
    
        
            
    if user != nil && user!.isEmailVerified == true {
    
    DispatchQueue.main.async {
    
    UIView.animate(withDuration: 0.8) {
            
    self.present(MainTabBarController(), animated: true, completion: nil)
            
            
    }

       
        
    }

    }
        
        })
    
    }
    
func addErrorLabel() {
        
self.stackView.arrangedSubviews.forEach { (selectedView) in
    
selectedView.transform = CGAffineTransform(translationX: 0, y: 30)
            
selectedView.addSubview(errorLabel)
errorLabel.setAutoLayout(top: customFbButton.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -19, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
            return
}

    

}
    
}
    

