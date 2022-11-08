//
//  AccountCollectionViewCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "AccountCollectionViewCell"
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var indexPath: IndexPath!
    weak var delegate : CardCollectionCellProtocol?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(item: CardModel?) {
        guard let item else { return }
        
        self.titleLabel.text = item.title
        descriptionLabel.text = item.description
        item.active ? (statusLabel.text = "Active") : (statusLabel.text = "Not Active")
        statusSwitch.isOn = item.active
        
    }
    
    @IBAction func didTapStatusSwitch(_ sender: UISwitch) {
        delegate?.didSelect(indexPath: indexPath, action: .toogleStatus, data: nil)
    }

}
