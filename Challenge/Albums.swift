//
//  Albums.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//
import UIKit
import Foundation
import Alamofire

class Albums{
    
    var albumId : Int!
    var albumTitle : String!
    
    var id : Int{
        if albumId == nil{
            albumId = 0
        }
        return albumId
    }
    var title : String{
        if albumTitle == nil{
            albumTitle = ""
        }
        return albumTitle
    }
    init(albumArray : [String:Any]) {
        if let id = albumArray["id"] as? Int{
            self.albumId = id
        }
        
        if let title = albumArray["title"] as? String{
            self.albumTitle = title
        }
    }
}
