//
//  VOIPTableViewController.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class VOIPTableViewController: UITableViewController{
    
    // MARK: - Variables
    public let customView: VOIPTableView = VOIPTableView.init(frame: .zero, style: .plain)
    
    public let cellId = "cellId"
    
    // MARK: - viewDidLoad
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.style()
        self.autoLayout()
        
        loadJSON()
    
        self.settingNotifications()
        
        tableView.register(VOIPCustomTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - TableView Settings
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! VOIPCustomTableViewCell
        let currentItem = globalObjects[indexPath.row]
        cell.parent = self
        cell.objectID.text = String(describing: currentItem.id)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalObjects.count
    }

    // MARK: - NSNotification Settings
    private func settingNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .VOIPReloadMainTableView, object: nil)
    }
    
    @objc func reloadData(){ self.tableView.reloadData() }
    
}


extension VOIPTableViewController: VOIPCustomView{
    func style() {}
    
    func autoLayout() {
        self.tableView.left(0.0).top(0.0).right(0.0).bottom(0.0)
    }
}
