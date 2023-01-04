//
//  Location.swift
//  week3
//
//  Created by BAE on 2023/01/05.
//

import Foundation
import UIKit

class LocationViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func initTitle(){
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
               
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = .systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "첫 번째 줄"
       
        let bottomTitle = UILabel(frame: CGRect(x: 0, y: topTitle.frame.height, width:200, height: 18))
        bottomTitle.numberOfLines = 1
        bottomTitle.textAlignment = .center
        bottomTitle.font = .systemFont(ofSize: 15)
        bottomTitle.textColor = .white
        bottomTitle.text = "두 번째 줄"
       
        containerView.addSubview(topTitle)
        containerView.addSubview(bottomTitle)
       
        self.navigationItem.titleView = containerView
        self.navigationController?.navigationBar.barTintColor = .brown
    }
}
