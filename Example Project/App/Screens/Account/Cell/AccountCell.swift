

import UIKit

class AccountCell: UITableViewCell {

    static let cellIdentifier: String = "AccountCell"
    
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ selected : Bool) {
        
        checkImage.isHidden = !selected
        titleLabel.textColor = selected ? .red : .black
        
    }
}
