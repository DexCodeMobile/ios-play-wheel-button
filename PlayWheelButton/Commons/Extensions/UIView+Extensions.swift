//
//  UIView+Extensions.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-13.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

extension UIView {
    
    var transformedDegree: CGFloat {
        let degrees = atan2(transform.b, transform.a) * 180.0 / .pi
        return degrees >= 0 ? degrees : 360 + degrees
    }
}
