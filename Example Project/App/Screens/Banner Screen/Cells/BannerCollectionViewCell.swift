//
//  BannerCollectionViewCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 9.11.22..
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    static var cellIdentifier = "BannerCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    
    private var bannerCell : BannerCell?
    
    var indexPath: IndexPath!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(item: BannerModel?) {
        guard let item else { return }
//
//        if bannerCell == nil {
//            let cell : BannerCell = BannerCell.fromNib()
//            self.bannerCell = cell
//            cell.configCell(item: item)
//
//            cell.seeAllButton.superview?.isHidden = true
//            containerView.addConstrainedSubview(subview: cell)
//        } else {
//            bannerCell?.indexPath = indexPath
//        }
            
    }

}
