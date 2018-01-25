//
//  PhotoCell.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    
 
    //Outlets
    @IBOutlet weak var flickrImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: String) {
        let url = URL(string:data)
        
        if let data = try? Data(contentsOf: url!)
        {
            flickrImage.image = UIImage(data: data)
            
        }
        
    }
}
