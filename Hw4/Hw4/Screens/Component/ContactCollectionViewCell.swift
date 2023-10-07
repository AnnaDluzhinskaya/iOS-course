//
//  ContactCollectionViewCell.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 06.10.2023.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {

    private var contactName: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var contactAvatar: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    private func setUpView() {
        layer.cornerRadius = 20
        layer.borderColor = CGColor(red: 0.5, green: 0.48, blue: 1, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
        
        contentView.addSubview(contactAvatar)
        contentView.addSubview(contactName)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        contactAvatar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contactAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contactAvatar.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            contactAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactAvatar.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3)
        ])
        
        contactName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contactName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactName.leadingAnchor.constraint(equalTo: contactAvatar.trailingAnchor, constant: 16)
        ])
    }
}

extension ContactCollectionViewCell: Providable {
    typealias ProvidedItem = ContactData
    
    func provide(_ item: ProvidedItem) {
        contactAvatar.image = item.avatar
        contactName.text = item.name
    }
}
