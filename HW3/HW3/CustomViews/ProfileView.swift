//
//  ProfileView.swift
//  HW3
//
//  Created by Anna Dluzhinskaya on 25.09.2023.
//

import UIKit

final class ProfileView: UIView {
    
    private let profileImage = {
        var view = UIImageView()
        view.image = UIImage(named: "barbie-profile-image")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let nameLable = {
        var lable = UILabel()
        lable.textColor = .systemPink
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return lable
    }()
    
    private let priceLable = {
        var lable = UILabel()
        lable.textColor = .systemGreen
        lable.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: DefaultData) {
        updateInfo(name: data.name, price: data.price)
    }
    
    private func setUpView() {
        layer.cornerRadius = 20
        layer.borderColor = CGColor(red: 255, green: 0, blue: 221, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
        
        addSubview(profileImage)
        addSubview(nameLable)
        addSubview(priceLable)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: profileImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: profileImage, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.7, constant: 0)
        ])
        
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLable, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: nameLable, attribute: .leading, relatedBy: .equal, toItem: profileImage, attribute: .trailing, multiplier: 1, constant: 16)
        ])
        
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: priceLable, attribute: .top, relatedBy: .equal, toItem: nameLable, attribute: .bottom, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: priceLable, attribute: .leading, relatedBy: .equal, toItem: profileImage, attribute: .trailing, multiplier: 1, constant: 16)
        ])
    }
}

extension ProfileView {
    func updateInfo(name: String, price: Double) {
        nameLable.text = name
        priceLable.text = String(price) + " $"
    }
}

