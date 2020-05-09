//
//  ViewController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 20/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

let pageControl: UIPageControl = {
let pgControl = UIPageControl()
pgControl.currentPage = 0
pgControl.currentPageIndicatorTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
pgControl.numberOfPages = Page.fetchPages().count
pgControl.pageIndicatorTintColor = UIColor.black
pgControl.isUserInteractionEnabled = false
return pgControl
    
}()

    
lazy var loginButton: UIButton = {
let button = UIButton()
button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.setTitle("Login", for: .normal)
button.addTarget(self, action: #selector(pushLogin), for: .touchUpInside)
button.tintColor = .white
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
button.isUserInteractionEnabled = true
return button
        
        
}()
    
lazy var registerButton: UIButton = {
let button = UIButton()
button.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
button.setTitle("New to stampay?", for: .normal)
button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
button.tintColor = .white
button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
return button
}()
    
  
    
var pages: [Page]?
    
let cellId = "cellId"
    
let collectionView: UICollectionView =  {
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .horizontal
layout.minimumLineSpacing = 0
layout.minimumInteritemSpacing = 6
let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
cv.isPagingEnabled = true
cv.backgroundColor = .white
return cv
}()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllViews()
        pages = Page.fetchPages()
 
        
        
        
        
    
}
func setupAllViews() {
            
    view.backgroundColor = .white
    navigationController?.isNavigationBarHidden = true
    setupCollectionView()
    setupBottomButtons()
    setupPageControl()
    
    
    
}
    
      

    
func setupCollectionView() {
    
view.addSubview(collectionView)

collectionView.setAutoLayout(top: view.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
    
    
collectionView.delegate = self
collectionView.dataSource = self
collectionView.showsHorizontalScrollIndicator = false
collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
  
}
    
func setupBottomButtons() {
    
    
let stackView = UIStackView(arrangedSubviews: [loginButton,registerButton])
stackView.distribution = .fillEqually
stackView.axis = .vertical
stackView.spacing = 6
    
collectionView.addSubview(stackView)
    
stackView.setAutoLayout(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 60, paddingRight: 60, widht: 0, height: 90)

        


}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
  
        
        
        self.navigationController?.isNavigationBarHidden = true
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return pages?.count ?? 0
    
    
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
    
    
    cell.page = pages?[indexPath.item]
    
    return cell
    
    }
    
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let size: CGSize = CGSize(width: view.frame.width, height: view.frame.height)
    
    return size
    
    
    }
    
    
    @objc func handleRegister() {
    
    let viewController = RegisterController()
    self.navigationController?.pushViewController(viewController, animated: true)
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem?.tintColor = UIColor.white
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        
    }
  
    func setupPageControl() {
        
    view.addSubview(pageControl)
        
    pageControl.setAutoLayout(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
     
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    let x = targetContentOffset.pointee.x
        
    pageControl.currentPage = Int(x/view.frame.width)
        
        
    }
    
    @objc func pushLogin() {
        
    print("tapped")

    let loginController = LoginController()
    self.navigationController?.pushViewController(loginController, animated: true)
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem?.tintColor = UIColor.white
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        


        
    }


}

