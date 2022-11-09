//
//  BannerCellProtocol.swift
//  Example Project
//
//  Created by Nikola Veljic on 9.11.22..
//

import Foundation


protocol BannerCellProtocol: AnyObject {
    func didSelect(indexPath: IndexPath?, action: BannerCellAction?, data: Any?)
    func scrollTo(indexPath: IndexPath?)
}


enum BannerCellAction {
    case hideBanner
}
