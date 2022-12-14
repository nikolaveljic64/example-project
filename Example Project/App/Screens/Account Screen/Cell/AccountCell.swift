//
//  AccountCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit

class AccountCell: UITableViewCell {

    static let cellIdentifier: String = "AccountCell"
    
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(title: String?, _ selected : Bool) {
        
        checkImage.isHidden = !selected
        titleLabel.textColor = selected ? .systemBlue : .systemGray
        titleLabel.text = title
        
    }
}
