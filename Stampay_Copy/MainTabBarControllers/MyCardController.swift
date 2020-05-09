//
//  MyCardController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 25/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

class MyCardController: UIViewController {
    
let qrImageView: UIImageView = {
let imageView = UIImageView(image: #imageLiteral(resourceName: "qrCode"))
return imageView
}()
    
    
let cardImage: UIImageView = {
let imageView = UIImageView(image: #imageLiteral(resourceName: "karte"))
return imageView
}()
 
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNav()
    addImages()
   
}
    
func addImages() {
view.addSubview(qrImageView)
qrImageView.setAutoLayout(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: 20, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 200, height: 200)
qrImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
view.backgroundColor = .white
        
view.addSubview(cardImage)
        
cardImage.setAutoLayout(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: nil, right: nil, paddingTop: 0, paddingbottom: 20, paddingLeft: 0, paddingRight: 0, widht: 330, height: 240)
cardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
}
    
func setupNav() {
    self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
    self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    
    navigationController?.isNavigationBarHidden = true

        

}
    
override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    
        UIScreen.main.brightness = 1.0
       
        self.animateImage()
    
    }
    
    
    
    
    
func animateImage() {
    
  

        
UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
    
self.qrImageView.transform = CGAffineTransform(rotationAngle: -26)
self.qrImageView.alpha = 1
        }) { (_) in
            
self.animateImage()
           
}
        
}
    
}
