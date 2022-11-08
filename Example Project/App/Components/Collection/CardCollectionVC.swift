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
    
    private let cardtCollectionVM = CardCollectionVM()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCollectionViewCell.nib, forCellWithReuseIdentifier: CardCollectionViewCell.cellIdetifier)
        
        if data.isEmpty {
            cardtCollectionVM.getData()
        }
        
    }
    
    func reload(_ items : [CardModel] = []) {
        self.data = items
        collectionView.reloadData()
    }
}

extension CardCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
   
    
}


extension CardCollectionVC: CardCollectionVCProtocol {
    
    func didSelect(indexPath: IndexPath?, action: CardCollectionVCAction?, data: Any?) {
        
    }
    
}
