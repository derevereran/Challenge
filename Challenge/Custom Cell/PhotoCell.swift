//
//  PhotoCell.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageTitle: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    func configureCel(photos:Photo){
        titleLabel.text=photos.title
        image.sd_setImage(with: URL(string: photos.photoUrl))
        image.contentMode=UIViewContentMode.scaleAspectFill
    }
}
