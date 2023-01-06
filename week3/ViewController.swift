//
//  ViewController.swift
//  week3
//
//  Created by BAE on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {
    
    var nowPage: Int = 0

    let dataArray: Array<UIImage> = [UIImage(named: "banner1.png")!,UIImage(named: "banner2.png")!, UIImage(named: "banner3.png")!, UIImage(named: "banner1.png")!]
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerTimer()
        setNavigationLeftItem()
//        setLocationViewToRoot()
        setNavigationSearchController()
    }

    func bannerTimer(){
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){
            (Timer) in self.bannerMove()
        }
    }
    
    // nowPage에 따라 스크롤 동작
    func bannerMove(){
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        
        if nowPage == dataArray.count-1 {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
                self.scrolltoFirstIndex()
            }
            return
        }
    }
    func scrolltoFirstIndex(){
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: false)
        nowPage = 0
        
    }
    
    func setNavigationLeftItem(){
        let image = UIImage(named: "myhome.png")
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(presentModal(_:)), for: .touchUpInside)
//        button.frame = CGRect(x: 0, y: 0, width: 30, height: 10)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    
    
    
    @IBAction func presentModal(_ sender: Any){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Location") as? LocationViewController else { return }
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        navigationController.modalPresentationStyle = .pageSheet

//        if let sheet = vc.sheetPresentationController {
            //지원할 크기 지정
//            sheet.detents = [.medium(), .large()]
            //크기 변하는거 감지
//            sheet.delegate = self

            //시트 상단에 그래버 표시 (기본 값은 false)
//            sheet.prefersGrabberVisible = true

            //처음 크기 지정 (기본 값은 가장 작은 크기)
            //sheet.selectedDetentIdentifier = .large

            //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
            //sheet.largestUndimmedDetentIdentifier = .medium
//        }
//        present(vc, animated: true, completion: nil)
// ----------------------------------------------------------------------
        // navigationController를 선언하고 rootView로 VC2를 할당
        

        // 화면 전환 커스텀, 필자는 PullScreen으로 띄우고, VC2에서 navigationBar가 보이지 않게 설정
//        navigationController.modalPresentationStyle = .fullScreen

        // 해당 navigationController를 모달 형태로 present
        present(navigationController, animated: true)
        
    }
    
    func setLocationViewToRoot(){
        // VC2를 코드 내에서 사용 가능하게 선언(StoryBoard 상에서 identifier 지정 필수)
        guard let vc = storyboard?.instantiateViewController(identifier: "Location") as? LocationViewController else { return }

        // navigationController를 선언하고 rootView로 VC2를 할당
        let navigationController = UINavigationController(rootViewController: vc)

        // 화면 전환 커스텀, 필자는 PullScreen으로 띄우고, VC2에서 navigationBar가 보이지 않게 설정
        navigationController.modalPresentationStyle = .fullScreen

        // 해당 navigationController를 모달 형태로 present
//        present(navigationController, animated: true)
    }
    func setNavigationSearchController(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "배고프니까 일단 검색!"
        self.navigationItem.searchController = searchController
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    // 컬렉션 뷰의 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    // 컬렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = dataArray[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 10
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    // 컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.size.height)
    }
    
    // 컬렉션 뷰 내부 마진
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    
    // 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

        switch nowPage{
        case 0:
            let last = dataArray.count-2
            self.bannerCollectionView.scrollToItem(at: [0, last], at: .left, animated: false)
        case dataArray.count-1:
            self.bannerCollectionView.scrollToItem(at: [0,1], at: .left, animated: false)
        default:
            break
        }
    }
    
}
