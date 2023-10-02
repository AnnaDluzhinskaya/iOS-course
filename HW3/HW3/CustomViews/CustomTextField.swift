//
//  CustomTextField.swift
//  HW3
//
//  Created by Anna Dluzhinskaya on 25.09.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func setUpView() {
        layer.cornerRadius = 20
        layer.borderColor = CGColor(red: 255, green: 0, blue: 221, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
    }
}
