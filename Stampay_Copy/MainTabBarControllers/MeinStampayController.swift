//
//  MeinStampayController.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 25/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

class MeinStampayController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false
        setupNav()
        
    }
        
    func setupNav() {
 
    self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
    self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = "You do not have any stampsets yet.\nTap here to see partners near you."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        
        view.addSubview(label)
        
        label.setAutoLayout(top: nil, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingbottom: 0, paddingLeft: 20, paddingRight: 20, widht: 0, height: 50)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        
        return label
        
        
    }
    
    

    
    
    
}
