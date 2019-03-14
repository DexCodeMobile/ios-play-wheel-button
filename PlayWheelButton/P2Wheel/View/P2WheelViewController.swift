//
//  P2WheelViewController.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-14.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit

// MARK: - P2WheelViewController
final class P2WheelViewController: UIViewController {

    // MARK: IBOutlet Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wheelView: WheelView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: Internal Properties
    let viewModel: P2WheelViewModel = P2WheelViewModel()
    
    // MARK: Private Properties
    var initialTansform: CGAffineTransform!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PhotoCollectionViewCell.self)
    
        viewModel.fetch(numOfRandomAssets: 10) { [weak self] in
            self?.collectionView.reloadData()
        }
        
        configureViews()
        
        initialTansform = wheelView.transform
    }
}

// MARK: - IBActions
extension P2WheelViewController {
    
    @IBAction func didTapWheelButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.wheelView.transform = self.wheelView.transform.rotated(by: self.viewModel.radian)
            self.viewModel.updateSelectedIndex()
        }) { (finished) in
            if let selectedImage = self.viewModel.selectedImage {
                self.imageView.image = selectedImage
            }
            self.collectionView.selectItem(at: IndexPath(item: self.viewModel.selectedIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        }
    }

    @IBAction func didTapSelectX(_ sender: Any) {
        guard let text = textField.text else {
            return
        }
        
        if viewModel.validationTextField(text: text) == false {
            presentAlertController("Invalid Number", message: "The number should be between 10 and 20.\nPlease try again.", actions: [UIAlertAction(title: "OK", style: .default, handler: nil)])
            return
        }
        
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.wheelView.transform = self.initialTansform.rotated(by: 0)
            self.viewModel.updateSelectedIndex()
        }) { (finished) in
            self.imageView.image = nil
            let numOfAssets = Int(text) ?? 0
            self.viewModel.fetch(numOfRandomAssets: numOfAssets) { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension P2WheelViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        viewModel.configure(photoCell: &cell, atIndex: indexPath.item)
        return cell
    }
}

// MARK: - Privates
extension P2WheelViewController {
    
    private func configureViews() {
        wheelView.configureWheelView(withBackgroundColor: .blue, shouldHideWheelButton: false)
        imageView.thumbnailStyle()
        if let selectedImage = viewModel.selectedImage {
            imageView.image = selectedImage
        }
        
        textField.text = String("\(viewModel.numOfAssets)")
    }
}
