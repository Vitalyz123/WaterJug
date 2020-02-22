//
//  ActionTableViewCell.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit
import Cartography

class ActionTableViewCell: TableViewCell {
    static let Identifier = "ActionTableViewCellIdentifier"

    private let actionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    var action: String? {
        get { actionLabel.text }
        set { actionLabel.text = newValue }
    }

    private let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 14.0)
        
        return label
    }()

    var state: String? {
        get { stateLabel.text }
        set { stateLabel.text = newValue }
    }

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8.0
        view.axis = .vertical
        
        return view
    }()
        
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(stackView)
        stackView.addArrangedSubview(actionLabel)
        stackView.addArrangedSubview(stateLabel)
        
        constrain(stackView) { $0.edges == $0.superview!.edges.inseted(by: 8.0) }
    }
}
