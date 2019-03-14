//
//  UICollectionView+Extensions.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import Foundation
import UIKit

// MARK: - NibFileLoadable
protocol NibFileLoadable {}
extension NibFileLoadable where Self: UICollectionViewCell {
    
    static var nib : UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

// MARK: - Reusable
protocol Reusable {}
extension Reusable where Self: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - UICollectionViewCell
extension UICollectionViewCell: NibFileLoadable, Reusable {}

// MARK: - UICollectionView
extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
