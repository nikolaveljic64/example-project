//
//  Helpers.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation
import UIKit

protocol VCProtocol: AnyObject {
    func inProgress(action: Action?)
    func onSuccess(data: Any?, action: Action?)
    func onError(error: Error, action: Action?)
}


enum Action {
    case getData
}

// MARK: - Nib init
extension UIView {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    class func fromNib<T: UIView>() -> T! {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as? T
    }
}



extension UIApplication {
    var primaryWindow: UIWindow? {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
    var visibleViewController: UIViewController? {
        guard let rootViewController = primaryWindow?.rootViewController else {
            return nil
        }
        return getVisibleViewController(rootViewController)
    }

    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        return rootViewController
    }
}
