//
//  Providable.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 07.10.2023.
//

import Foundation

protocol Providable {
    associatedtype ProvidedItem: Hashable
    func provide(_ item: ProvidedItem)
}
