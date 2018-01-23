//
//  PhotoCell.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
 
    @IBOutlet weak var flickrImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        flickrImage.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.6509803922, blue: 0.137254902, alpha: 1)
    }
}
