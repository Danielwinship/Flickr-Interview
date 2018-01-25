//
//  FlickrService.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import Foundation
import Alamofire

class FlickrService {
    
    static let instance = FlickrService()
    
    var flickrPhotoArray = [FlickrPhotoModel]()
    var flickrUrl = [FlickrPhotoModel]()
    var finalFlickrUrl = [String]()
    
    func getFlickrUrl(completion: @escaping CompletionHandler) {
        Alamofire.request("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=bf5284a38136f72c9cf5af7cd0112f6d&per_page=40&format=json&nojsoncallback=1").responseJSON { (response) in
            if response.result.error == nil {
            guard let json = response.result.value as? Dictionary<String, AnyObject> else {return}
               self.loadFlickrUrlToArray(data: json)
            completion(true)
        }else {
            completion(false)
            debugPrint(response.result.error as Any)
        }
    }
}
    func loadFlickrUrlToArray(data: Dictionary<String,AnyObject>) {
        let photosDict = data["photos"] as! Dictionary<String, AnyObject>
        let photosDictArray = photosDict["photo"] as! [Dictionary<String, AnyObject>]
        print(photosDictArray)
        
        for photo in photosDictArray {
            let flickrPhoto = FlickrPhotoModel(id: photo["id"] as! String, secret: photo["secret"] as! String,farm: photo["farm"] as! Int,server:photo["server"] as! String)
            self.flickrPhotoArray.append(flickrPhoto)
        }
        buildFlickrUrlFromArray()
    }
    
    func buildFlickrUrlFromArray() {
        for url in flickrPhotoArray {
            let urlString = "https://farm\(url.farm).staticflickr.com/\(url.server)/\(url.id)_\(url.secret)_z_d.jpg"
            finalFlickrUrl.append(urlString)
        
        }
        
    }
}


