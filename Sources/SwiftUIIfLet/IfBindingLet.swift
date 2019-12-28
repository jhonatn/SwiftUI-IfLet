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

struct IfBindingLet_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            IfBindingLet(Binding<String?>.constant(nil)) { nlol in
                VStack {
                    Text("This won't appear because the variable used is nil")
                    TextField("Input", text: nlol)
                }
            }
            IfBindingLet(Binding<String?>.constant(nil), { nlol in
                TextField("Input", text: nlol)
            }, else: {
                Text("This text will appear, since the variable used is nil")
            })
        }.previewLayout(.sizeThatFits)
            .padding(10)
    }
}
