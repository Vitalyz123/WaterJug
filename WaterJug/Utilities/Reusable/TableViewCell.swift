//
//  TableViewCell.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    func commonInit() {
        applyStyling()
        setupSubviews()
        setupTargets()
    }
    
    func applyStyling() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    func setupSubviews() {}
    func setupTargets() {}
}
