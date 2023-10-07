//
//  ContactData.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 06.10.2023.
//

import UIKit

struct ContactData: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var phoneNumber: String
    var avatar: UIImage?
}
