//
//  SubmitInputTableViewCell.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit
import Cartography

class SubmitInputTableViewCell: TableViewCell {
    static let Identifier = "SubmitInputTableViewCellIdentifier"
    
    var didTapSubmitClosure: (() -> Void)?
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5.0
        
        return button
    }()

    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(submitButton)
        constrain(submitButton) {
            $0.edges == $0.superview!.edges.inseted(by: 16.0)
            $0.height == 50.0
        }
    }
    
    override func setupTargets() {
        super.setupTargets()
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
    }
    
    @objc private func didTapSubmitButton() {
        didTapSubmitClosure?()
    }
}
