//
//  DetailVC.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import UIKit
import Alamofire
import PinterestLayout

class PhotoVC : UIViewController{
    @IBOutlet var photosCollectionView: UICollectionView!
    var photo : Photo!
    var photos = [Photo]()
    var getAlbumId : Int?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.delegate=self
        photosCollectionView.dataSource=self
        downloadPhotosData {
        }
        let layout = PinterestLayout()
        photosCollectionView.collectionViewLayout=layout
        layout.delegate = self
        setupCollectionViewInsets()
        layout.cellPadding = 5
        
        if self.photosCollectionView.frame.size.height>self.photosCollectionView.frame.size.width{
             layout.numberOfColumns = 2
        }
    }
    private func setupCollectionViewInsets() {
        photosCollectionView!.contentInset = UIEdgeInsets(
            top: 15,
            left: 5,
            bottom: 49,
            right: 5
        )
    }
    func orietetionChanged(){
       
    }
    
    func downloadPhotosData(completed: @escaping DownloadComplete){
        
        Alamofire.request(PHOTOS_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? [[String : Any]] {
                
                for obj in dict {
                    if let id = obj["albumId"]{
                        if id as? Int == self.getAlbumId! {
                            let photo = Photo(photoArray: obj)
                            self.photos.append(photo)
                        }
                    }
                }
                self.photosCollectionView.reloadData()
            }
            completed()
        }
    }
}

extension PhotoVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoVC", for: indexPath) as! PhotoCell
        
        cell.configureCel(photos:photos[indexPath.row])
        return cell
    }
}

extension PhotoVC : PinterestLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(200)+300)
    }
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        return 0
    }
    
}
