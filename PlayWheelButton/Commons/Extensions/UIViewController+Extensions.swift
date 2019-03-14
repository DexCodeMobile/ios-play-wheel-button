//
//  UIViewController+Extensions.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertController(_ title: String?, message: String?, style: UIAlertController.Style = .alert, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach {
            alertController.addAction($0)
        }
        present(alertController, animated: true, completion: nil)
    }
}
