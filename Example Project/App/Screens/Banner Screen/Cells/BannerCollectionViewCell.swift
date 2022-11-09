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
    weak var delegate: BannerCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(item: BannerModel?) {
        guard let item else { return }
        
        if bannerCell == nil {
            let cell : BannerCell = BannerCell.fromNib()
            self.bannerCell = cell
            cell.configCell(item: item)
            // Send action from child vc or cell
            /// It easy if `BannerVC` use `CellProtocol` but what if we have different protocol for communicating
            cell.bannerCellDelegate = delegate
            cell.indexPath = indexPath
            cell.seeAllButton.superview?.isHidden = true
            containerView.addConstrainedSubview(subview: cell)
        } else {
            bannerCell?.indexPath = indexPath
        }
            
        
       
        
    }

}
