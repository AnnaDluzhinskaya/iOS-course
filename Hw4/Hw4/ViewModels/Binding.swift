//
//  Binding.swift
//  Hw4
//
//  Created by Anna Dluzhinskaya on 07.10.2023.
//

import Foundation

class Binding<T> {
    typealias Handler = (T) -> Void
    
    public var value: T {
        didSet {
            handler?(value)
        }
    }
    
    private var handler: Handler?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ handler: Handler?) {
        handler?(value)
        self.handler = handler
    }
}
