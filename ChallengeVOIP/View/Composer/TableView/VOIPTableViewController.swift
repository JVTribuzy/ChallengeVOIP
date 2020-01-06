//
//  VOIPTableViewController.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class VOIPTableViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.view = VOIPTableView.init(frame: .zero, style: .plain)
    }
}
