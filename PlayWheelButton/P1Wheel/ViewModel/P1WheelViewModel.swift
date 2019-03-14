//
//  P1WheelViewModel.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-09.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import Foundation

struct P1WheelViewModel {
    
    var randomDegrees: Int {
        return Int.random(in: 0..<360)
    }
}
