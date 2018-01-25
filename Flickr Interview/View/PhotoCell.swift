//
//  PhotoCell.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    
 
    //Outlets
    @IBOutlet weak var flickrImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: UIImage) {
       flickrImage.image = data
    }
    
    
    
    
    
}
