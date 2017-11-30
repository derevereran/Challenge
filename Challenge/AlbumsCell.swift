//
//  AlbumsCell.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import UIKit

class AlbumsCell: UITableViewCell {
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    func configureCell(album: Albums) {
      albumTitleLabel.text = album.title.capitalized
    }
}
