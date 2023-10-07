//
//  ContactViewController.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 07.10.2023.
//

import UIKit

class ContactViewController: UIViewController {
    
    private var imageView = ImageScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var contactData: ContactData?
    
    init(contactData: ContactData) {
        self.contactData = contactData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contactData = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure(contactData: contactData)
        
        setUpView()
    }
    
    private func configure(contactData: ContactData?) {
        imageView.set(image: (contactData?.avatar)!)
        nameLabel.text = contactData?.name
        phoneLabel.text = contactData?.phoneNumber
    }
    
    private func setUpView() {
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(phoneLabel)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
