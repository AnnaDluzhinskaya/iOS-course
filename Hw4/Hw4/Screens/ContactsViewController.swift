//
//  ViewController.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 06.10.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    private var datasource: [ContactData] = [
        ContactData(name: "Anna Dlu", phoneNumber: "+7 (910) 889-10-01", avatar: UIImage(named: "woman-avatar1")),
        ContactData(name: "Kate Bell", phoneNumber: "(555) 564-8583", avatar: UIImage(named: "woman-avatar2")),
        ContactData(name: "John Doe", phoneNumber: "(888) 555-5512", avatar: UIImage(named: "man-avatar1")),
        ContactData(name: "Anna Dlu 2", phoneNumber: "+7 (910) 889-10-01", avatar: UIImage(named: "woman-avatar1")),
        ContactData(name: "Kate Bell 2", phoneNumber: "(555) 564-8583", avatar: UIImage(named: "woman-avatar2")),
        ContactData(name: "John Doe 2", phoneNumber: "(888) 555-5512", avatar: UIImage(named: "man-avatar1")),
        ContactData(name: "Anna Dlu 3", phoneNumber: "+7 (910) 889-10-01", avatar: UIImage(named: "woman-avatar1")),
        ContactData(name: "Kate Bell 3", phoneNumber: "(555) 564-8583", avatar: UIImage(named: "woman-avatar2")),
        ContactData(name: "John Doe 3", phoneNumber: "(888) 555-5512", avatar: UIImage(named: "man-avatar1"))
    ]
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private lazy var viewModel = ContactsViewModel(collectionView: collectionView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setUpView()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = viewModel.makeDataSource()
        viewModel.add(datasource)
        
        collectionView.delegate = self
    }
    
    private func setUpView() {
        navigationItem.title = "Contacts"
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: collectionView.topAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor)
        ])
    }
}

extension ContactsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.present(
            ContactViewController(contactData: viewModel.items.value[indexPath.row]),
            animated: true)
    }
}
