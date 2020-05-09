//
//  Extension.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 20/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

extension UIView {
    
    func setAutoLayout(top: NSLayoutYAxisAnchor? , bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor? , right:  NSLayoutXAxisAnchor? , paddingTop: CGFloat , paddingbottom: CGFloat , paddingLeft: CGFloat, paddingRight: CGFloat , widht: CGFloat , height: CGFloat) {
        
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        
        if let top = top {
            
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingbottom).isActive = true
            
        }
        
        if let right = right {
            
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            
        }
        
        
        if let left = left {
            
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            
        }
        
        if widht != 0 {
            
            widthAnchor.constraint(equalToConstant: widht).isActive = true
            
        }
        
        if height != 0 {
            
            heightAnchor.constraint(equalToConstant: height).isActive = true
            
            
            
        }
        
    }
    
}
    
extension NSMutableAttributedString {
        
func setColorForText(textForAttribute: String, withColor color: UIColor) {
            let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
            
    
self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            
    

self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    
}
        
}
    
    
    

