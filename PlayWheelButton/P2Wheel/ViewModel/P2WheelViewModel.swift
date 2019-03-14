//
//  P2WheelViewModel.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import Foundation
import Photos

final class P2WheelViewModel {
    
    // MARK: Private properties
    private var images: [UIImage] = []
    private var thumbnailSize: CGSize = CGSize(width: 120, height: 120)
    
    // MARK: Internal properties
    var radian: CGFloat {
        return (360.0 / CGFloat(numOfAssets)) * .pi / 180.0
    }
    var selectedIndex: Int = -1
    var numOfAssets: Int = 10
}

// MARK: - Internals
extension P2WheelViewModel {
    
    var numOfItems: Int {
        return images.count
    }
    
    func configure(photoCell cell: inout PhotoCollectionViewCell, atIndex index: Int) {
        cell.imageView.image = images[index]
    }
    
    var selectedImage: UIImage? {
        guard images.indices.contains(selectedIndex) == true else { return nil }
        return images[selectedIndex]
    }
    
    func updateSelectedIndex() {
        selectedIndex = selectedIndex >= numOfAssets-1 ? 0 : selectedIndex + 1
    }
    
    func fetch(numOfRandomAssets: Int, complete: @escaping (() -> Void)) {
        images.removeAll()
        selectedIndex = -1
        numOfAssets = numOfRandomAssets
        DispatchQueue.global(qos: .background).async {
            let allPhotosOptions = PHFetchOptions()
            allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
            guard allPhotos.count > 0 else {
                complete()
                return
            }
            
            var images = [UIImage]()
            for _ in 0..<numOfRandomAssets {
                let index = Int.random(in: 0..<allPhotos.count)
                let asset = allPhotos.object(at: index)
                if let image = self.fetchImage(fromPhotoAssets: asset) {
                    images.append(image)
                }
            }
            
            self.images = images
            
            DispatchQueue.main.async {
                complete()
            }
        }
    }
    
    func validationTextField(text: String) -> Bool {
        guard let number = Int(text) else { return false }
        return number >= 10 && number <= 20
    }
}

extension P2WheelViewModel {
    
    private func fetchImage(fromPhotoAssets assets: PHAsset) -> UIImage? {
        let imageOption = PHImageRequestOptions()
        imageOption.isSynchronous = true
        var photo: UIImage?
        PHImageManager.default().requestImage(for: assets, targetSize: thumbnailSize, contentMode: .aspectFit, options: imageOption) { (image, info) in
            guard let image = image else { return }
            photo = image
        }
        
        return photo ?? UIImage(named: "AppIcon")
    }
}
