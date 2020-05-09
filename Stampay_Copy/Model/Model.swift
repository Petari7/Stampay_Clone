//
//  HomeCell.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 20/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

struct Page {

var image: UIImage
    
init(image: UIImage) {
    self.image = image
}
    
static func fetchPages() -> [Page] {
    
let pages  = [
    
Page(image: #imageLiteral(resourceName: "stampay")),
Page(image: #imageLiteral(resourceName: "stampay2")),
Page(image: #imageLiteral(resourceName: "stampay3")),
Page(image: #imageLiteral(resourceName: "stampay4")),
Page(image: #imageLiteral(resourceName: "stampay5"))
  
]
return pages
}
    
}

