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
    var apiObjects: [APIObject] = [APIObject]()
    
    // MARK: - viewDidLoad
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.style()
        self.autoLayout()
        
        createObjectArray()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - TableView Settings
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let currentItem = apiObjects[indexPath.row]
        cell.textLabel?.text = currentItem.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiObjects.count
    }

    func createObjectArray(){
        apiObjects.append(APIObject(albumID: 1, id: 1, title: "Título 1", url: nil, thumbNailURL: nil))
        apiObjects.append(APIObject(albumID: 1, id: 2, title: "Título 2", url: nil, thumbNailURL: nil))
        apiObjects.append(APIObject(albumID: 1, id: 3, title: "Título 3", url: nil, thumbNailURL: nil))
        
        tableView.reloadData()
        
    }
}


extension VOIPTableViewController: VOIPCustomView{
    func style() {}
    
    func autoLayout() {
        self.tableView.left(0.0).top(0.0).right(0.0).bottom(0.0)
    }
}
