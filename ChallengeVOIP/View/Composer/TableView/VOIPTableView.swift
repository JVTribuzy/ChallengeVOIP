//
//  VOIPTableView.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class VOIPTableView: UITableView, VOIPCustomView{
    
    // MARK: - VOIPTableView Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: .zero, style: style)
        
        self.style()
        self.autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual
    func style() {
        self.backgroundColor = .white
    }
    
    func autoLayout() {
        self.left(0.0).top(0.0).right(0.0).bottom(0.0)
        
    }
    
}
