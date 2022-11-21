//
//  GalleryCollectionViewCell.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.roundCorners(radius: 15)
        }
    }
}
