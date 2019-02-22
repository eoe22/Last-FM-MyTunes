//
//  AlbumViewController.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/1/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var album: Album!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        titleLabel.text = album.title
        artistLabel.text = album.artist
        imageView.sd_setImage(with: URL(string: album.url), placeholderImage: nil)
    }
}
