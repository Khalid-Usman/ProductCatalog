//
//  FeedImageCellController.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import Foundation
import GenericCellControllers

class FeedImageCellController: GenericCellController<FeedImageTableViewCell> {

    private var picture: Picture
    private let coordinator: FeedCoordinator

    init(picture: Picture,
         coordinator: FeedCoordinator) {
        self.picture = picture
        self.coordinator = coordinator
    }

    override func configureCell(_ cell: FeedImageTableViewCell) {
        // Easy configuration since the Cell Controller receive the right type of cell and
        // it is already holding the data this cell needs to display.
        cell.authorLabel.text = "\(picture.author)"
        cell.descLabel.text = "\(picture.desc)"
        cell.weightLabel.text = "\(picture.weight)"
        cell.priceLabel.text = "\(picture.price)"
        cell.quantityLabel.text = "\(picture.quantity)"
        cell.pictureImageView.loadImage(urlString: picture.imageName)
        cell.trashButton.addTarget(self, action: #selector(didTapTrash), for: .touchUpInside)
        cell.incdecView.layer.borderColor = UIColor.lightGray.cgColor
        cell.incButton.addTarget(self, action: #selector(didTapIncrementStepper), for: .touchUpInside)
        cell.decButton.addTarget(self, action: #selector(didTapDecrementStepper), for: .touchUpInside)
    }
    
    @objc private func didTapIncrementStepper() {
        coordinator.quantityIncreasedDecreased(picture, isPlus: true)
    }
    
    @objc private func didTapDecrementStepper() {
        coordinator.quantityIncreasedDecreased(picture, isPlus: false)
    }
    
    @objc private func didTapTrash() {
        coordinator.itemDeleted(picture)
    }

    override func didSelectCell() {
        // We can call the right method in the coordinator since the Cell Controller only deals
        // with one type of data.
        coordinator.pictureSelected(picture)
    }

}
