//
//  VOIPTableView.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class VOIPTableView: UITableView, VOIPCustomView{
    
    // MARK: - VOIPTableView Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: .zero, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual
    func style() {}
    
    func autoLayout() {}
    
}
