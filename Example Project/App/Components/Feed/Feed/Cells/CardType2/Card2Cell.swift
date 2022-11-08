//
//  Card2Cell.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class Card2Cell: UITableViewCell {

    static var cellIdentifier = "Card2Cell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: CellProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: CardModel1?) {
        guard let item else { return }
        
        self.titleLabel.text = item.title
        item.active ? (statusLabel.text = "Active") : (statusLabel.text = "Not Active")
    }
    
    
    
}
