//
//  BannerCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 9.11.22..
//

import UIKit

class BannerCell: UITableViewCell {

    static var cellIdentifier = "BannerCell"
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
   
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var seeAllButton: UIButton!
    
    @IBOutlet weak var hideButton: UIButton!
    var indexPath: IndexPath!
    var banner: BannerModel!
   
    /// This is used on main feed
    weak var delegate: CellProtocol?
    
    /// other delegate for other vc
    weak var bannerCellDelegate: BannerCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func configCell(item: BannerModel?) {
        self.banner = item
        
        guard let item else { return }
        
        titleLabel.text = item.time
        subTitleLabel.text = item.description
        priceLabel.text = item.price
        monthLabel.text = "Monthly"
     
    }
    
    
    @IBAction func didTapAll(_ sender: UIButton) {
        delegate?.didSelect(indexPath: indexPath, action: .seeAll, data: banner)
    }
    
    @IBAction func didTapHide(_ sender: UIButton) {
        bannerCellDelegate?.didSelect(indexPath: indexPath, action: .hideBanner, data: banner)
        delegate?.didSelect(indexPath: indexPath, action: .hideBanner, data: banner)
    }
    
}
