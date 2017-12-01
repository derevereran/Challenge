//
//  AlbumsViewController.swift
//  Challenge
//
//  Created by Devran ates on 11/29/17.
//  Copyright © 2017 devran ates. All rights reserved.
//

import UIKit
import Alamofire

class AlbumsViewController: UIViewController {
    @IBOutlet weak var albumsTable: UITableView!
    var album : Albums!
    var albums = [Albums]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumsTable.delegate = self
        albumsTable.dataSource = self
        self.downloadAlbumsData {
        }
    }
    
    func downloadAlbumsData(completed: @escaping DownloadComplete){
        
        Alamofire.request(ALBUMS_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? [[String : Any]] {
                
                for obj in dict {
                    let album = Albums(albumArray: obj)
                    self.albums.append(album)
                }
                self.albumsTable.reloadData()
            }
            completed()
        }
    }
}

extension AlbumsViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell" ) as! AlbumsCell
        
        cell.configureCell(album: albums[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated: true)
        let PVC = storyboard?.instantiateViewController(withIdentifier:"PhotosVC") as! PhotoVC
        PVC.getAlbumId=albums[indexPath.row].albumId
        self.navigationController?.pushViewController(PVC, animated: true)
    }
}

