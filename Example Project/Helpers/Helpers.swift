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


protocol CellProtocol: AnyObject {
    func didSelect(indexPath: IndexPath?, action: CellAction?, data: Any?)
    func scrollTo(indexPath: IndexPath?)
}


enum CellAction {
    case toogleStatus
    case seeAll
    case removeBanner
    case hideBanner
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


// MARK: - Insert constrained subview
extension UIView {
    func embed(childViewController: UIViewController) {
        self.addSubview(childViewController.view)
        constrainViewEqual(holderView: self, view: childViewController.view)
    }
    
    func constrainViewEqual(holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: holderView, attribute: .top, multiplier: 1.0, constant: 0)
        let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let pinLeft = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: holderView, attribute: .left, multiplier: 1.0, constant: 0)
        let pinRight = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: holderView, attribute: .right, multiplier: 1.0, constant: 0)
        
        holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
    }
    
    func addConstrainedSubview(subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func addConstrainedSubviewToSafeAreas(subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
