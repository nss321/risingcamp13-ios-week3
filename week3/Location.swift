//
//  Location.swift
//  week3
//
//  Created by BAE on 2023/01/05.
//

import Foundation
import UIKit

class LocationViewController: UIViewController{
    
    @IBOutlet weak var searchBarImageVIew: UIImageView!
    @IBOutlet weak var navigationRightItem: UIBarButtonItem!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    
    @IBOutlet weak var tv: UITableView!
    
    var nameList: [String] = [
        "사람1", "사람2", "사람3", "사람4", "사람5", "사람6", "사람7", "사람8", "사람9", "사람10", "사람11",
        "사람12", "사람13", "사람14"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarImageVIew.layer.cornerRadius = 10
        setNavigationRightItem()
        setGestureRecognizer()
        tv.delegate = self
        tv.dataSource = self
        tv.register(UINib(nibName: "firstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstTableViewCell")
//        setNavigationSearchController()
    }
    
    func setNavigationTitle(){
//        navigationTitle.style=
    }
    func setNavigationRightItem(){
        navigationRightItem.target = self
        navigationRightItem.action = #selector(pushMangeAddress(_:))
    }
    
    @IBAction func pushMangeAddress(_ sender: Any) {
            guard let ManageAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "ManageAddress") else { return }
        self.navigationController?.pushViewController(ManageAddressViewController, animated: true)
    }
    
    func setGestureRecognizer(){
        let tapImageViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
       //이미지뷰가 상호작용할 수 있게 설정
        searchBarImageVIew.isUserInteractionEnabled = true
       //이미지뷰에 제스처인식기 연결
        searchBarImageVIew.addGestureRecognizer(tapImageViewRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
        {
            guard let SearchAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchAddress") else { return }
            
//            SearchAddressViewController.modalPresentationStyle = .fullScreen
//            SearchAddressViewController.navigationController?.isNavigationBarHidden = false
            
            
//            present(SearchAddressViewController,animated: true)
            self.navigationController?.pushViewController(SearchAddressViewController, animated: true)
        }
    func setNavigationSearchController(){
//        let tapSearchControllerRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchControllerTapped(tapGestureRecognizer:)))
        
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.isUserInteractionEnabled = true
//        searchController.searchBar.addGestureRecognizer(tapSearchControllerRecognizer)
        
        self.navigationItem.searchController = searchController
    }
//    @objc func searchControllerTapped(tapGestureRecognizer: UITapGestureRecognizer)
//        {
//            guard let SearchAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchAddress") else { return }
//            self.navigationController?.pushViewController(SearchAddressViewController, animated: true)
//        }
    
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 행의 개수
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell UI
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCell", for: indexPath) as! firstTableViewCell
        // indexPath.row => 행을 의미
        
        cell.nameLabel.text = nameList[indexPath.row]
        
        
        return cell
    }

}
