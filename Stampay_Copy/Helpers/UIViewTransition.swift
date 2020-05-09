//
//  UIViewTransition.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 24/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

class UIViewTransition: NSObject, UIViewControllerAnimatedTransitioning {
  
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        let containerView = transitionContext.containerView
        
       
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        let homeController = HomeController()
        guard let toView = homeController.view else { return }
        
        containerView.addSubview(toView)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
        fromView.frame = CGRect(x: -fromView.frame.width, y: 0, width: fromView.frame.width, height: fromView.frame.height)
        
        toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
            
            
        }) { (_) in
            
            transitionContext.completeTransition(true)
        }
    
    

    
    
}
}
