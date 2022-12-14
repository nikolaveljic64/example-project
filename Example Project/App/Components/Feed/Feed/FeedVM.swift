//
//  FeedVM.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation
import UIKit

class FeedVM {
    
    
    var completion: (([CellController]) -> Void)?
    
    func getData(self: UIViewController) {
    

        var data: [CellController] = []
        
        
        data.append(CardType1CellController(model: dummyCardModelOne))
        
        data.append(CardType2CellController(model: dummyCardModelOne))
        
        
        let bannerCellController = BannerCellController(model: dummyBanner1, delegate: self as! FeedVC)
        
        data.append(bannerCellController)
        
        data.append(CardWidgetCellCellController(items: dummyArrayCardModel))
    
    
        completion?(data)
        
    }
    
    
    func openBannerVC(_ self: UIViewController) {
        let storyboard = UIStoryboard(name: "Banner", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BannerVC") as! BannerVC
        vc.data = Manager.shared.banners
        self.present(vc, animated: true)
    }
    
}
