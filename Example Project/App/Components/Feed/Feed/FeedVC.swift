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
    private var data: [CellController] = []
    private let feedVM = FeedVM()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .init(top: 25, left: 0, bottom: 25, right: 0)
        

        BannerCellController.configure(tableView: tableView)
        CardType1CellController.configure(tableView: tableView)
        CardType2CellController.configure(tableView: tableView)
        CardWidgetCellCellController.configure(tableView: tableView)
        
        
        feedVM.delegate = self
        
        loadData()
    }
    
    func loadData() {
        switch feedType {
        case .mainCardFeed:
            feedVM.getData(self: self)
        case .detailsScreen:
            break
            // Example for different cell for other screen type
//            feedVM.arrangePostFeedData()
        case .none:
            break
        }
      
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
        let controller = data[indexPath.row]
        return controller.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].tableView(tableView, didSelectRowAt: indexPath)
    }
}

extension FeedVC: BannerCellControllerCellProtocol {
    func didTapHide(indexPath: IndexPath) {
        self.data.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
}


extension FeedVC: VCProtocol {
    
    func inProgress(action: Action?) {
        
    }
    
    func onSuccess(data: Any?, action: Action?) {
        switch action {
        case .getData:
            if let data = data as? [CellController] {
                self.data = data
                self.tableView.reloadData()
            }
        default:
           break
        }
    }
    
    func onError(error: Error, action: Action?) {
        print(error.localizedDescription)
    }
    
    
}
