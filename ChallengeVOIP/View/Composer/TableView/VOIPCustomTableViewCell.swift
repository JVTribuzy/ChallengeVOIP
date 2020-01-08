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
        objectIDLabel.font = UIFont.boldSystemFont(ofSize: 18)
        objectIDLabel.textAlignment = .center
        objectIDLabel.layer.masksToBounds = true
        objectIDLabel.layer.cornerRadius = 25
        objectIDLabel.backgroundColor = .lightGray
        return objectIDLabel
    }()
    
    let title: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 3
        return titleLabel
    }()
    
//    private let productImage : UIImageView = {
//    let imgView = UIImageView(image: #imageLiteral(resourceName: “glasses”))
//    imgView.contentMode = .scaleAspectFit
//    imgView.clipsToBounds = true
//    return imgView
//    }()
    
    let thumbnailImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    // MARK: - Changing Image
    
    // MARK: - Visual
    func style() {}
    
    func autoLayout() {
        sv(objectID,
           thumbnailImage,
           title)
        
        thumbnailImage.size(150).top(15).bottom(15).left(73)
        objectID.centerVertically().size(50).left(8).top(15).bottom(15)
        title.top(15).right(15).left(238)
        
    }
}
