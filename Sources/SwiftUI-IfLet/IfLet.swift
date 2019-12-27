//
//  IfLet.swift
//  SwiftUI-IfLet
//
//  Created by baguio on 12/4/19.
//  Copyright © 2019 baguio. All rights reserved.
//

import SwiftUI

public struct IfLet<T, Out: View, EmptyOut: View>: View {
    let value: T?
    let produce: (T) -> Out
    let produceIfNil: () -> EmptyOut

    public init(_ value: T?,
         then produce: @escaping (T) -> Out,
         else produceIfNil: @escaping () -> EmptyOut)
    {
        self.value = value
        self.produce = produce
        self.produceIfNil = produceIfNil
    }

    public var body: some View {
        Group {
            if value != nil {
                produce(value!)
            }
        }
    }
}

public extension IfLet where EmptyOut == EmptyView {
    init (_ value: T?,
          then produce: @escaping (T) -> Out) {
        self.init(value, then: produce, else: {
            return EmptyView()
        })
    }
}
