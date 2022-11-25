//
//  FeedVM.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation
import UIKit

class FeedVM {
    
    weak var delegate: VCProtocol!
    
    func getData() {
    
        delegate.inProgress(action: .getData)
            
        var data: [CellController] = []
        
        
        data.append(CardType1CellController(model: dummyCardModelOne))
        
        data.append(CardType2CellController(model: dummyCardModelOne))
        
        data.append(BannerCellController(model: dummyBanner1))
        
        data.append(CardWidgetCellCellController(items: dummyArrayCardModel))
    
    
     
        delegate.onSuccess(data: data, action: .getData)
        
    }
    
    
    func openBannerVC(_ self: UIViewController) {
        let storyboard = UIStoryboard(name: "Banner", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BannerVC") as! BannerVC
        vc.data = Manager.shared.banners
        self.present(vc, animated: true)
    }
    
}
