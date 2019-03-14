//
//  PhotoCollectionViewCell.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.thumbnailStyle(cornerRadius: 8.0)
    }
}
