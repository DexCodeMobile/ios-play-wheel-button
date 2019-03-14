//
//  ThumbnailImageStylable.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

protocol ThumbnailImageStylable { }

extension ThumbnailImageStylable where Self: UIImageView {
    
    func thumbnailStyle(cornerRadius: CGFloat = 0.0) {
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}

extension UIImageView: ThumbnailImageStylable {}
