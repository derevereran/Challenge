//
//  Photo.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import Foundation
import Alamofire

class Photo{
    var photoAlbumId :Int!
    var photoTitle:String!
    var photoUrl:String!
    
    var albumId:Int{
        if photoAlbumId==nil{
            photoAlbumId=0
        }
        return photoAlbumId
    }
    var title:String{
        if photoTitle == nil{
            photoTitle = ""
        }
        return photoTitle
    }
    var url:String {
        if photoUrl == nil{
            photoUrl = ""
        }
        return photoUrl
    }
    
    init(photoArray : [String:Any]) {
        if let id = photoArray["albumId"] as? Int{
            self.photoAlbumId = id
        }
        if let title = photoArray["title"] as? String{
            self.photoTitle = title
        }
        if let url = photoArray["url"] as? String{
            self.photoUrl = url
        }
    }
    
//    this comment fot commit
}
