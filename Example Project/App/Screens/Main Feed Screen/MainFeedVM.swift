//
//  MainFeedVM.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import Foundation
import UIKit

class MainFeedVM {
    
    weak var delegate: VCProtocol!
    
    func openAccount(_ self: UIViewController) {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        vc.selectedAccount = Manager.shared.selectedAccount
        vc.delegate = self as? MainFeedVC
        self.present(vc, animated: true)
    }
    
}
