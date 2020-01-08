//
//  APIObject.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

public class APIObject {
    var albumID: Int
    var id: Int
    var title: String
    var url: String
    var thumbNailURL: String
    
    static let placeholderImage: UIImage = {
        return UIImage(named: "placeholder")!
    }()
    static let defaultSize: CGSize = {
        return APIObject.placeholderImage.size
    }()
    
    private static let imageDownloadSession = URLSession(configuration: URLSessionConfiguration.default)
    
    
    //MARK: - Download Thumnail Image
    public var thumbNailCachedImage: UIImage? = nil
    
    var thumbNailImage: UIImage {
        if thumbNailCachedImage == nil {
            thumbNailCachedImage = APIObject.placeholderImage
            fetchThumbNailImage()
        }

        return thumbNailCachedImage!
    }

    private func fetchThumbNailImage() {
        guard let url = URL(string: self.thumbNailURL) else {
            return
        }

        let task = APIObject.imageDownloadSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data, error == nil else {
                return
            }
            
            
            DispatchQueue.main.async {
                self.thumbNailCachedImage = UIImage(data: data, scale: UIScreen.main.scale)
                NotificationCenter.default.post(name: .VOIPReloadMainTableView, object: nil)
            }
            
        }

        task.resume()
    }
    
    //MARK: - Download Full Image
    public var fullCachedImage: UIImage? = nil
    
    var fullImage: UIImage {
        if fullCachedImage == nil {
            fullCachedImage = APIObject.placeholderImage
            fetchFullImage()
        }

        return fullCachedImage!
    }

    private func fetchFullImage() {
        guard let url = URL(string: self.url) else {
            return
        }

        let task = APIObject.imageDownloadSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data, error == nil else {
                return
            }
            
            
            DispatchQueue.main.async {
                self.fullCachedImage = UIImage(data: data, scale: UIScreen.main.scale)
                NotificationCenter.default.post(name: .VOIPReloadDetailView, object: nil)
            }
            
        }

        task.resume()
    }
    
    
    //MARK: - init
    init(_ dictionary: [String: Any]) {
        self.albumID = dictionary["albumID"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.thumbNailURL = dictionary["thumbnailUrl"] as? String ?? ""
    }
}

public var globalObjects: [APIObject] = [APIObject]()

func loadJSON(){
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let dataResponse = data,
              error == nil else {
              print(error?.localizedDescription ?? "Response Error")
              return }
        do{
            let jsonResponse = try JSONSerialization.jsonObject(with:
                                   dataResponse, options: [])
            
            guard let jsonArray = jsonResponse as? [[String: Any]] else {
                  return
            }
            for dictionary in jsonArray{
                DispatchQueue.main.async {
                    globalObjects.append(APIObject(dictionary))
                    NotificationCenter.default.post(name: .VOIPReloadMainTableView, object: nil)
                }
            }
            
        } catch let parsingError {
            print("Error", parsingError)
        }
        
        
    }
    task.resume()
    
    
}



// MARK: - Download Session for the Images
//let placeholderImage: UIImage = {
//    return UIImage(named: "placeholder")!
//}()
//
//let defaultSize: CGSize = {
//    return CGSize(width: 150, height: 150)
//}()
//
//let imageDownloadSession = URLSession(configuration: URLSessionConfiguration.default)
//
//private var cachedImage: UIImage? = nil
//
//var image: UIImage {
//    if cachedImage == nil {
//        cachedImage = placeholderImage
//    }
//
//    return cachedImage!
//}
//
//private func fetchImage(url: URL) {
//    let task = imageDownloadSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//        guard let data = data, error == nil else {
//            return
//        }
//        cachedImage = UIImage(data: data, scale: UIScreen.main.scale)
//        
//    }
//
//    task.resume()
//}
