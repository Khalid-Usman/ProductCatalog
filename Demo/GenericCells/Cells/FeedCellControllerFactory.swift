//
//  FeedCellControllerFactory.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import Foundation
import GenericCellControllers

class FeedCellControllerFactory {

    func registerCells(on tableView: UITableView) {
        // The factory is the only one who knows the exact Cell Controllers we are using, hence,
        // it is responsible for registering them in the UITableView/UICollectionView

        FeedImageCellController.registerCell(on: tableView)
    }

    func cellControllers(from elements: [Picture], coordinator: FeedCoordinator) -> [TableCellController] {
        // Matching each type of data to the right Cell Controller is now something we only do once. Here.

        return elements.map { (element) in
            return FeedImageCellController(picture: element, coordinator: coordinator)
        }
    }

}
