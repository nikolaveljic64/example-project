//
//  FeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var feedType: FeedType!
    
    // Private variables
    private var data: [Feed] = []
    private let feedVM = FeedVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .init(top: 25, left: 0, bottom: 25, right: 0)
        
        tableView.register(Card2Cell.nib, forCellReuseIdentifier: Card2Cell.cellIdentifier)
        tableView.register(CardCell.nib, forCellReuseIdentifier: CardCell.cellIdentifier)
        tableView.register(CardTypeBothCell.nib, forCellReuseIdentifier: CardTypeBothCell.cellIdentifier)
        tableView.register(CardWidget.nib, forCellReuseIdentifier: CardWidget.cellIdentifier)
        tableView.register(BannerCell.nib, forCellReuseIdentifier: BannerCell.cellIdentifier)
        
        feedVM.delegate = self
        
        loadData()
    }
    
    func loadData() {
        feedVM.getData()
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row].type {
        case .cardType1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.cellIdentifier, for: indexPath) as? CardCell {
                cell.delegate = self
                cell.indexPath = indexPath
                cell.configCell(item: data[indexPath.row].cardType1)
                return cell
            }
        case .cardType2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Card2Cell.cellIdentifier, for: indexPath) as? Card2Cell {
                cell.delegate = self
                cell.configCell(item: data[indexPath.row].cardType2)
                return cell
            }
        case .cardTypeBoth:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: CardTypeBothCell.cellIdentifier, for: indexPath) as? CardTypeBothCell {
                cell.delegate = self
                cell.indexPath = indexPath
                cell.configCell(item: data[indexPath.row].cardType)
                return cell
            }
        case .collectionViewEmbeded:
            // How to have automatic height when we use embeded collection view
            if let cell = tableView.dequeueReusableCell(withIdentifier: CardWidget.cellIdentifier, for: indexPath) as? CardWidget {
                cell.configCell(items: data[indexPath.row].cardArrays)
                return cell
            }
            
            break
        case .banner:
            if let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.cellIdentifier, for: indexPath) as? BannerCell {
                cell.selectionStyle = .none
                cell.delegate = self
                cell.indexPath = indexPath
                cell.configCell(item: data[indexPath.row].banner)
                return cell
            }
            
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch data[indexPath.row].type {
        case .cardType1:
            break
        case .cardType2:
            break
        case .cardTypeBoth:
            break
        default: break
        }
    }
    
}

extension FeedVC: CellProtocol {
    
    func didSelect(indexPath: IndexPath?, action: CellAction?, data: Any?) {
        switch action {
        case .toogleStatus:
            guard let indexPath else { return }
            
            switch self.data[indexPath.row].type {
            case .cardType1:
                self.data[indexPath.row].cardType1?.active.toggle()
            case .cardTypeBoth:
                // To pass data
                if let cardType = data as? CardModel {
                    self.data[indexPath.row].cardType = cardType
                }
    
            default: break
            }
            
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            
        case .seeAll:
            feedVM.openBannerVC(self)
        case .hideBanner:
            guard let indexPath else { return }
            self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        default: break
        }
    }
    
    func scrollTo(indexPath: IndexPath?) {
        
    }
    
}

extension FeedVC: VCProtocol {
    
    func inProgress(action: Action?) {
        
    }
    
    func onSuccess(data: Any?, action: Action?) {
        switch action {
        case .getData:
            if let data = data as? [Feed] {
                self.data = data
                self.tableView.reloadData()
            }
        default: break
        }
    }
    
    func onError(error: Error, action: Action?) {
        print(error.localizedDescription)
    }
    
    
}
