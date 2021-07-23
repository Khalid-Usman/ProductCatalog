//
//  FeedImageTableViewCell.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import UIKit
import SpriteKit

class FeedImageTableViewCell: UITableViewCell {

    /*
    private let photoImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return iv
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.Regular.rawValue, size: 14.0)
        label.textColor = .mainGray
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.Regular.rawValue, size: 14.0)
        label.textColor = .black
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.Regular.rawValue, size: 14.0)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.Bold.rawValue, size: 14.0)
        label.textColor = .black
        return label
    }()
        
    private lazy var trashButton: UIButton = {
        let trash = UIButton(type: .system)
        trash.setImage(#imageLiteral(resourceName: "like_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
        trash.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
        return trash
    }()
    
    static var cellId = "feedImageCellId"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.leading.equalTo(superview).inset(10)
            make.trailing.equalTo(view).inset(10)
            make.bottom.equalTo(proceedButton.snp.top).offset(-12)
            make.height.equalTo(30.0)
        }
        photoImageView.anchor(top: likeCounter.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: padding - 6, paddingLeft: padding, paddingRight: padding)
            
        addSubview(pageControlView)
        pageControlView.anchor(left: leftAnchor, bottom: likeButton.topAnchor, right: rightAnchor, paddingBottom: 2*padding, height: 30.0)
    }
    */
    
    @IBOutlet weak var pictureImageView: CustomImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var incdecView: UIView!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var incButton: UIButton!
    @IBOutlet weak var decButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
}
