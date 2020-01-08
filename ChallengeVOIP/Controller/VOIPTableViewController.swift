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

class VOIPTableViewController: UITableViewController, UINavigationControllerDelegate{
    
    // MARK: - Variables
        
    public let cellId = "cellId"
    
    override init(style: UITableView.Style) {
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.style()
        self.autoLayout()
        
        loadJSON()
        
        self.settingNotifications()
        
        tableView.register(VOIPCustomTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
//        self.navigationController?.delegate = self
        self.navigationController?.title = "Objects"
        
    }
    
    // MARK: - TableView Settings
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! VOIPCustomTableViewCell
        let current = globalObjects[indexPath.row]
        cell.objectID.text = String(describing: current.id)
        cell.albumID.text = String(describing: current.albumID)
        cell.title.text = String(describing: current.title)
        cell.thumbnailImage.image = current.thumbNailImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalObjects.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = VOIPDetailViewController(nibName: nil, bundle: nil, object: globalObjects[indexPath.row]) // Your destination
        navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - NSNotification Settings
    private func settingNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .VOIPReloadMainTableView, object: nil)
    }
    
    @objc func reloadData(){self.tableView.reloadData()}
    
}


extension VOIPTableViewController: VOIPCustomView{
    func style() {}
    
    func autoLayout() {}
}
