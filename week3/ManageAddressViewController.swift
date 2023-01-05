//
//  ManageAddressViewController.swift
//  week3
//
//  Created by BAE on 2023/01/05.
//

import Foundation
import UIKit

class ManageAddressViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        setNavigationTitle()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)]
    }
    
    func setNavigationTitle(){
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        title.numberOfLines = 1
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 20)

        title.text = "주소 관리"

        self.navigationItem.titleView = title
    }
}

