//
//  PageCell.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 20/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit



class PageCell: UICollectionViewCell {
    
    
    var page: Page? = nil {
        
        didSet {
            
            guard let page = page else { return }
            
            imageView.image = page.image
            
        }
        
        
    }
    
    
    
    
    
    
let imageView: UIImageView = {
let iv = UIImageView()
iv.contentMode = .scaleAspectFit
return iv
    
}()
    
   
override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

func setupViews() {
    
addSubview(imageView)
    
imageView.setAutoLayout(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 120, paddingbottom: 0, paddingLeft: 0, paddingRight: 0, widht: 0, height: 0)
        
        
        

}
    
    
}
