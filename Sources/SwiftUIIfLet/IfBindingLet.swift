//
//  IfBindingLet.swift
//  SwiftUI-IfLet
//
//  Created by baguio on 12/4/19.
//  Copyright © 2019 baguio. All rights reserved.
//

import SwiftUI

public struct IfBindingLet<T, Out: View, EmptyOut: View>: View {
    @Binding var value : Optional<T>
    let produce: (Binding<T>) -> Out
    let produceIfNil: () -> EmptyOut

    public var body: some View {
        Group {
            if value != nil {
                produce(Binding($value)!)
            } else {
                produceIfNil()
            }
        }
    }
}

public extension IfBindingLet {
    init(_ value: Binding<T?>,
         _ produce: @escaping (Binding<T>) -> Out,
         else produceIfNil: @escaping () -> EmptyOut )
    {
        self.init(value: value,
                  produce: produce,
                  produceIfNil: produceIfNil)
    }
}

public extension IfBindingLet where EmptyOut == EmptyView {
    init(_ value: Binding<T?>,
         _ produce: @escaping (Binding<T>) -> Out)
    {
        self.init(value, produce, else: {
            return EmptyView()
        })
    }
}
