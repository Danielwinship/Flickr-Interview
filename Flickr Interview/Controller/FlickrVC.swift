//
//  ViewController.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit



class FlickrVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
   
    
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        FlickrService.instance.getFlickrUrl { (success) in
            if success == true {
                //FlickrService.instance.buildFlickrUrlFromArray()
            }
        }
    }
    
   

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? PhotoCell else {return UICollectionViewCell()}
        //print(FlickrService.instance.finalFlickrUrl[0])
          //cell.configureCell(data: FlickrService.instance.finalFlickrUrl[indexPath.row])
        
         return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


}

