//
//  P1WheelViewController.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-09.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

// MARK: - P1WheelViewController
final class P1WheelViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var spinWheelButton: SpinWheelButton!
    @IBOutlet weak var wheelView: WheelView!
    
    // MARK: Internal Properties
    let viewModel: P1WheelViewModel = P1WheelViewModel()
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

// MARK: - IBActions
extension P1WheelViewController {
    
    @IBAction func didTapButton(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.wheelView.transform = self.wheelView.transform.rotated(by: CGFloat(self.viewModel.randomDegrees))
        }) { (finished) in
            self.spinWheelButton.degreeTitle = self.wheelView.transformedDegree
        }
    }
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        guard let view = recognizer.view, view is WheelView else { return }
        view.transform = view.transform.rotated(by: recognizer.rotation)
        updateSpinWheelButtonTitle()
    }
}

// MARK: - SingleTapRotationGestureRecognizer Action
extension P1WheelViewController {
    
    @objc func rotateSingleTapGesture(recognizer: SingleTapRotationGestureRecognizer) {
        guard let view = recognizer.view, view is WheelView else { return }
        view.transform = view.transform.rotated(by: recognizer.rotation)
        updateSpinWheelButtonTitle()
    }
}

// MARK: - Privates
extension P1WheelViewController {
    
    private func configureViews() {
        wheelView.configureWheelView(withBackgroundColor: .orange)
        let singleTapGesture: SingleTapRotationGestureRecognizer = SingleTapRotationGestureRecognizer(target: self, action:#selector(rotateSingleTapGesture))
        wheelView.addGestureRecognizer(singleTapGesture)
    }
    
    private func updateSpinWheelButtonTitle() {
        spinWheelButton.degreeTitle = wheelView.transformedDegree
    }
}
