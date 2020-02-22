//
//  InputTableViewCell.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit
import Cartography

class InputTableViewCell: TableViewCell {
    static let Identifier = "InputTableViewCellIdentifier"
    
    var didUpdateInputValueClosure: ((_ value: Int?) -> Void)?
    
    private let containerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    var containerTitle: String? {
        get { containerLabel.text }
        set { containerLabel.text = newValue }
    }
    
    private let valueTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Value"
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    var containerValuePlaceholder: String? {
        get { valueTextField.placeholder }
        set { valueTextField.placeholder = newValue }
    }
        
    override func setupSubviews() {
        addSubview(containerLabel)
        addSubview(valueTextField)
        
        constrain(containerLabel, valueTextField) { label, textField in
            label.top       	== label.superview!.top + 8.0
            label.left          == label.superview!.left + 8.0
            label.bottom        == label.superview!.bottom - 8.0
            label.right         == label.superview!.centerX - 8.0
            label.height        >= 24.0
            
            textField.top       == textField.superview!.top + 8.0
            textField.right     == textField.superview!.right - 8.0
            textField.bottom    == textField.superview!.bottom - 8.0
            textField.left      == textField.superview!.centerX + 8.0
        }
    }
    
    override func setupTargets() {
        valueTextField.addTarget(self, action: #selector(textFieldDidChangeValue(_:)), for: .editingChanged)
    }

    @objc private func textFieldDidChangeValue(_ textField: UITextField) {
        if let text = textField.text {
            didUpdateInputValueClosure?(Int(text))
        } else {
            didUpdateInputValueClosure?(nil)
        }
    }
}
