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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
