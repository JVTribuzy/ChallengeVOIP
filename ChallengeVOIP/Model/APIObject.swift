//
//  APIObject.swift
//  ChallengeVOIP
//
//  Created by João Tribuzy on 06/01/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

public struct APIObject {
    var albumID: Int
    var id: Int
    var title: String
    var url: URL
    var thumbNailURL: URL
    
    init(_ dictionary: [String: Any]) {
        self.albumID = dictionary["albumID"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? URL ?? URL(fileURLWithPath: "")
        self.thumbNailURL = dictionary["thumbNailURL"] as? URL ?? URL(fileURLWithPath: "")
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
