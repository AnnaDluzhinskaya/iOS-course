//
//  ViewController.swift
//  HW3
//
//  Created by Anna Dluzhinskaya on 25.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var profileView = ProfileView()
    private var nameTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Enter name"
        textField.textColor = .systemPink
        textField.tintColor = .systemPink
        
        return textField
    }()
    
    private var priceTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Enter price"
        textField.keyboardType = .decimalPad
        textField.textColor = .systemGreen
        textField.tintColor = .systemGreen
        
        return textField
    }()
    
    private var updateButton = {
        var button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .systemPink
        button.setTitle("Update info", for: .normal)
        button.setTitleColor( .white, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        print("viewDidLoad")
    }

    private func setUpView() {
        view.backgroundColor = .white
        
        view.addSubview(profileView)
        view.addSubview(nameTextField)
        view.addSubview(priceTextField)
        view.addSubview(updateButton)
        setUpLayout()
        
        profileView.configure(with: DefaultData())
        
        updateButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setUpLayout() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: profileView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: profileView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        ])
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameTextField, attribute: .top, relatedBy: .equal, toItem: profileView, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: nameTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: nameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
        
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: priceTextField, attribute: .top, relatedBy: .equal, toItem: nameTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: priceTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: priceTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: priceTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: updateButton, attribute: .top, relatedBy: .equal, toItem: priceTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: updateButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: updateButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -40),
            NSLayoutConstraint(item: updateButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
    }
    
    @objc func buttonAction() {
        profileView.updateInfo(name: nameTextField.text ?? "", price: Double(priceTextField.text ?? "") ?? 0)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Logs

extension ViewController {
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
}

