//
//  BannerVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 9.11.22..
//

import UIKit

// Is better to create separate collection view and to use conatiner view if we can use this data on multiple places
class BannerVC: BottomPopupViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [BannerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BannerCollectionViewCell.nib, forCellWithReuseIdentifier: BannerCollectionViewCell.cellIdentifier)
        
    }
    
    override var popupHeight: CGFloat {
        return UIScreen.main.bounds.size.height * 0.4
    }
    
    override var popupPresentDuration: Double {
        return 0.25
    }
    
    override var popupDimmingViewAlpha: CGFloat {
        return 0.5
    }

}

extension BannerVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellIdentifier, for: indexPath) as? BannerCollectionViewCell {
//            cell.indexPath = indexPath
//            cell.delegate = self
//            cell.configCell(item: data[indexPath.row])
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: UIScreen.main.bounds.width * 0.8, height: 135)
    }
    
}

extension BannerVC: BannerCellProtocol {
    func didSelect(indexPath: IndexPath?, action: BannerCellAction?, data: Any?) {
        
        switch action {
        case .hideBanner:
            guard let indexPath else { return }
            
            // Wrong indexPath, why?
            self.data.remove(at: indexPath.row) // Index out of range
           // self.collectionView.deleteItems(at: [indexPath])
            
            if self.data.isEmpty {
                self.dismiss(animated: true)
            }
            
        default: break
            
        }
       
    }
    
    func scrollTo(indexPath: IndexPath?) { }
    
}
