//
//  VOIPDetailViewController.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 08/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class VOIPDetailViewController: UIViewController, UINavigationControllerDelegate, VOIPCustomView {
    
    private var imageView = UIImageView()
    private var objectImage: APIObject
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, object: APIObject) {
        objectImage = object
        super.init(nibName: nil, bundle: nil)
        
        imageView = UIImageView(image: object.fullImage)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.style()
        self.autoLayout()
        self.navigationController?.delegate = self
        self.setNotifications()
    }
    
    func setNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadScreen), name: .VOIPReloadDetailView, object: nil)
    }
    
    @objc func reloadScreen(){
        imageView.image = objectImage.fullImage
    }
}

extension VOIPDetailViewController{
    func style() {
        self.view.backgroundColor = .green
        self.imageView.contentMode = .scaleAspectFill
    }
    
    func autoLayout() {
        self.view.sv(imageView)
        imageView.top(0.0).left(0.0).right(0.0).bottom(0.0)
        self.view.top(0.0).left(0.0).right(0.0).bottom(0.0)
        
    }
    
}
