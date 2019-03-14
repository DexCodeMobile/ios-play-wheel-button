//
//  SingleTapRotationGestureRecognizer.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-13.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import Foundation
import UIKit
import UIKit.UIGestureRecognizerSubclass

// MARK: - SingleTapRotationGestureRecognizer
final class SingleTapRotationGestureRecognizer: UIGestureRecognizer {
    
    // MARK: Internal Properties
    var rotation: CGFloat {
        return angle(forPoint: currentPoint) - angle(forPoint: previousPoint)
    }
    
    // MARK: Private Properties
    private var currentPoint: CGPoint = .zero
    private var previousPoint: CGPoint = .zero
    
    // MARK: Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        guard touches.first != nil, view != nil else { return }
        
        state = .began
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first, let touchedView = view else { return }
        
        currentPoint = touch.location(in: touchedView)
        previousPoint = touch.previousLocation(in: touchedView)
        
        state = .changed
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        currentPoint = .zero
        previousPoint = .zero
        
        state = .ended
    }
}

// MARK: - Privates
extension SingleTapRotationGestureRecognizer {
    
    private func angle(forPoint point: CGPoint) -> CGFloat {
        guard let view = view else { return 0.0 }
        let offset = CGPoint(x: point.x - view.bounds.midX, y: point.y - view.bounds.midY)
        return atan2(offset.y, offset.x)
    }
}
