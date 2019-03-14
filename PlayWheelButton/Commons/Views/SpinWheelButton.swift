//
//  SpinWheelButton.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-13.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

class SpinWheelButton: UIButton {
    
    var degreeTitle: CGFloat = 0.0 {
        didSet {
            setTitle(String(format: "%.0f degrees", degreeTitle), for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        degreeTitle = 0.0
    }
}
