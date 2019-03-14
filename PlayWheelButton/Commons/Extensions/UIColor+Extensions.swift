//
//  UIColor+Extensions.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-13.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

extension UIColor {
    
    var inverted: UIColor {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: 1-r, green: 1-g, blue: 1-b, alpha: a)
    }
}
