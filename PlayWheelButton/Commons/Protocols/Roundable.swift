//
//  Roundable.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-13.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

protocol Roundable {}
extension Roundable where Self: UIView {
    
    func setupRoundView() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}
