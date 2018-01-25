//
//  ViewController.swift
//  Flickr Interview
//
//  Created by Daniel Winship on 1/23/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit



class FlickrVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
   var flickrUrlVC = [String]()
    
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        FlickrService.instance.getFlickrUrl()
      
        }
    
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        if  FlickrService.instance.imageArray.count == 0 {
            FlickrService.instance.getFlickrUrl()
            collectionView.reloadData()
        } else {
             collectionView.reloadData()
        }
       
       
    }
    
 
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FlickrService.instance.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? PhotoCell else {return PhotoCell()}
          cell.configureCell(data: FlickrService.instance.imageArray[indexPath.row])
         cell.clipsToBounds = true
         return cell
    }
   
   


}




