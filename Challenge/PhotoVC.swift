//
//  DetailVC.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import UIKit
import Alamofire

class PhotoVC:UIViewController{
    @IBOutlet var photosCollectionView: UICollectionView!
    var photo : Photo!
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.delegate=self
        photosCollectionView.dataSource=self
        downloadPhotosDataData {
        }
        

    }
    func downloadPhotosDataData(completed: @escaping DownloadComplete){
        
        Alamofire.request(PHOTOS_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? [[String : Any]] {
                
                for obj in dict {
                    let photo = Photo(photoArray: obj)
                    self.photos.append(photo)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        - (CGSize)collectionView:(UICollectionView *)collectionView
////        layout:(UICollectionViewLayout*)collectionViewLayout
////        sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
////
////            NSAttributedString* labelString = [[NSAttributedString alloc] initWithString:@"Your long string goes here" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]}];
////            CGRect cellRect = [labelString boundingRectWithSize:CGSizeMake(cellWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
////
////            return CGSizeMake(cellWidth, cellRect.size.height);
////        }
////         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoVC", for: indexPath) as! PhotoCell
////        size=cell.titleLabel.
//        return CGSize(width: ((self.view.frame.size.width-30)/2) ,
//                      height:((self.view.frame.size.width-30)/2))
//
//}
    
}
