//
//  VOIPCustomTableViewCell.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 07/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class VOIPCustomTableViewCell: UITableViewCell, VOIPCustomView {
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.style()
        self.autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Components
    let objectID: UILabel = {
        let objectIDLabel = UILabel()
        objectIDLabel.textColor = .black
        objectIDLabel.font = UIFont.boldSystemFont(ofSize: 20)
        objectIDLabel.textAlignment = .center
        objectIDLabel.layer.masksToBounds = true
        objectIDLabel.layer.cornerRadius = 25
        objectIDLabel.backgroundColor = .lightGray
        return objectIDLabel
    }()
    
//    let title: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.tex
//    }
    
    // MARK: - Visual
    func style() {}
    
    func autoLayout() {
        sv(objectID)
        
        objectID.centerVertically().size(50).left(15).top(15).bottom(15)
        
    }
}
