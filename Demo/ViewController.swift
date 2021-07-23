//
//  ViewController.swift
//  Demo
//
//  Created by mac on 17/07/2021.
//

import UIKit
import SnapKit
import GenericCellControllers

class ViewController: UIViewController {

    lazy var tblView = UITableView()
    
    private let cellControllerFactory = FeedCellControllerFactory()
    private var cellControllers: [TableCellController] = []
    
    let net = NetworkManager()
    
    var didSetupConstraints = false
    
    let navLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont(name: Fonts.Bold.rawValue, size: 20.0)
        label.text = "Shopping Cart"
        //label.text = NSLocalizedString("", comment: "")
        return label
    }()
    
    let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .mainGray
        return line
    }()
    
    let freeShippingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont(name: Fonts.Regular.rawValue, size: 16.0)
        
        //label.text = NSLocalizedString("", comment: "")
        return label
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.setProgress(0.5, animated: true)
        progressView.trackTintColor = .mainGray
        progressView.tintColor = .mainPurple
        return progressView
    }()
    
    let backgroundView: UIView = {
        let bg = UIView()
        bg.backgroundColor = .mainGray
        return bg
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont(name: Fonts.Regular.rawValue, size: 18.0)
        return label
    }()
    
    @objc func pressed() {
        /*
        // POST API Call
        net.addCart(completionHandler: {(isDone) in
            print(isDone)
        })
        */
    }
    
    let proceedButton: UIButton = {
        let proceedButton = UIButton()
        proceedButton.setTitle("Proceed to address", for: .normal)
        proceedButton.titleLabel?.font = UIFont(name: Fonts.Regular.rawValue, size: 18)!
        proceedButton.setTitleColor(.white, for: .normal)
        proceedButton.backgroundColor = .black
        proceedButton.layer.cornerRadius = 8
        proceedButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        return proceedButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(navLabel)
        view.addSubview(lineView)
        view.addSubview(freeShippingLabel)
        
        let stringValue = "There are 2 results."
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColor(color: .mainPurple, forText: "2")
        self.freeShippingLabel.attributedText = attributedString
        
        view.addSubview(backgroundView)
        
        view.addSubview(progressView)
        progressView.progress = 0.2
        
        view.addSubview(proceedButton)
        
        view.addSubview(costLabel)
        costLabel.text = "1 item(s) - SAR 159.85"
        
        view.setNeedsUpdateConstraints()
        
        tblView.delegate = self
        tblView.dataSource = self
        backgroundView.addSubview(tblView)
        tblView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backgroundView).inset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(backgroundView).inset(10)
        }
        tblView.backgroundColor = .mainGray
        tblView.layoutMargins = UIEdgeInsets.zero
        tblView.separatorInset = UIEdgeInsets.zero
        
        configureTableView()
        displayData()
        
        /*
        // Fetch Carts
        net.getCarts(completionHandler: { (posts) in
            print(posts)
            self.displayData()
        })
        */
    }
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            navLabel.snp.makeConstraints { make in
                make.top.equalTo(view).inset(44)
                make.leading.equalTo(view).inset(20)
                make.trailing.equalTo(view).inset(20)
                make.height.equalTo(44.0)
            }
            
            lineView.snp.makeConstraints { make in
                make.top.equalTo(navLabel.snp.bottom).offset(8)
                make.leading.equalTo(view).inset(0)
                make.trailing.equalTo(view).inset(0)
                make.height.equalTo(1.0)
            }
            
            freeShippingLabel.snp.makeConstraints { make in
                make.top.equalTo(lineView.snp.bottom).offset(8)
                make.leading.equalTo(view).inset(20)
                make.trailing.equalTo(view).inset(20)
                make.height.equalTo(22.0)
            }
            
            progressView.snp.makeConstraints { make in
                make.top.equalTo(freeShippingLabel.snp.bottom).offset(8)
                make.leading.equalTo(view).inset(20)
                make.trailing.equalTo(view).inset(20)
                make.height.equalTo(5.0)
            }
            
            backgroundView.snp.makeConstraints { make in
                make.top.equalTo(progressView.snp.bottom).offset(8)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.bottom.equalTo(costLabel.snp.top).offset(-8)
            }
            
            proceedButton.snp.makeConstraints { make in
                make.leading.equalTo(view).inset(10)
                make.trailing.equalTo(view).inset(10)
                make.bottom.equalTo(view).inset(40)
                make.height.equalTo(50.0)
            }
            
            costLabel.snp.makeConstraints { make in
                make.leading.equalTo(view).inset(10)
                make.trailing.equalTo(view).inset(10)
                make.bottom.equalTo(proceedButton.snp.top).offset(-12)
                make.height.equalTo(30.0)
            }
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func configureTableView() {
        cellControllerFactory.registerCells(on: tblView)
    }

    func displayData() {
        //let data = FeedDataProvider.harcodedData
        let data = FeedDataProvider.data
        cellControllers = cellControllerFactory.cellControllers(from: data, coordinator: FeedCoordinator(viewController: self))
        tblView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellControllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Delegate on your Cell Controllers the dequeuing of the cells.
        return cellControllers[indexPath.row].cellFromReusableCellHolder(tableView, forIndexPath: indexPath)
    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Pass the event to the Cell Controller. It is responsible for knowing what to do.
        cellControllers[indexPath.row].didSelectCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
