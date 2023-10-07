//
//  ContactsViewModel.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 07.10.2023.
//

import UIKit

class ContactsViewModel: CollectionViewModel<ContactCollectionViewCell> {

    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellReuseIdentifier: "ContactCell")
    }
}
