//
//  CardWidget.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit

class CardWidget: UITableViewCell {

    
    static var cellIdentifier = "CardWidget"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private var cardCollectionVC: CardCollectionVC!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //UIScreen.main.bounds.width * 0.44
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        heightConstraint.constant = UIScreen.main.bounds.width * 0.4
    }
    
    
    func configCell(items: [CardModel]?) {
        
        if cardCollectionVC == nil {
            let storyboard = UIStoryboard(name: "CardCollection", bundle: nil)
            cardCollectionVC = storyboard.instantiateViewController(withIdentifier: "CardCollectionVC") as? CardCollectionVC
            cardCollectionVC.type = .mainFeed
            cardCollectionVC.data = items ?? []
            containerView.embed(childViewController: cardCollectionVC)
        }
        
        cardCollectionVC.reload(items ?? [])
        
        layoutIfNeeded()
        
    }

}
