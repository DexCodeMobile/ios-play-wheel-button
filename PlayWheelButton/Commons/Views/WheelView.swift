//
//  WheelView.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-09.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

// MARK: - WheelView
class WheelView: UIView, Roundable {

    @IBOutlet weak var jogView: UIView!
    @IBOutlet weak var wheelButton: UIButton?
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        setupRoundView()
    }
}

// MARK: - Internals
extension WheelView {
    
    func configureWheelView(withBackgroundColor bgColor: UIColor = .lightGray, borderCoolor: UIColor = .darkGray, shouldHideWheelButton: Bool = true) {
        layer.borderColor = borderCoolor.cgColor
        layer.borderWidth = 4.0
        backgroundColor = bgColor
        jogView.backgroundColor = bgColor.inverted
        wheelButton?.isHidden = shouldHideWheelButton
    }
}
