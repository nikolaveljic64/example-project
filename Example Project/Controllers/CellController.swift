//
//  CellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit

protocol CellController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
}

extension CellController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
}
