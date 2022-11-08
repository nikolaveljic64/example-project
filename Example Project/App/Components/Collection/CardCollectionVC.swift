//
//  AccountCollectionVCViewController.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit


class CardCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // This VC to be used for all collection views with this DATA
    var data: [CardModel] = []
    var type: CardCollectionType!
    
    
    private let cardtCollectionVM = CardCollectionVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
      
        collectionView.register(CardCollectionViewCell.nib, forCellWithReuseIdentifier: CardCollectionViewCell.cellIdentifier)
        
        if data.isEmpty {
            cardtCollectionVM.getData()
        } 
        
        
    }
    
    func reload(_ items : [CardModel] = []) {
        self.data = items
    }
}

extension CardCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch type {
        case .mainFeed:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.cellIdentifier, for: indexPath) as? CardCollectionViewCell {
                cell.configCell(item: data[indexPath.row])
                return cell
            }
        default: break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellWidth: CGFloat!
        var cellHeight: CGFloat!
        
        switch type {
        case .mainFeed:
            cellWidth = UIScreen.main.bounds.width * 0.4
            cellHeight = cellWidth
        default: break
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if data.count == 1 {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch type {
        case .mainFeed:
           return 5
        default:
           return 10
        }
    }
    
}


extension CardCollectionVC: CardCollectionVCProtocol {
    
    func didSelect(indexPath: IndexPath?, action: CardCollectionVCAction?, data: Any?) {
        
    }
    
}
