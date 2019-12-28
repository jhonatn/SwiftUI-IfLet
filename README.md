# SwiftUI > IfLet

_SwiftUI > IfLet_ is an utility library that adds back a way to use the `if let` functionality on SwiftUI. Also, it adds a new funcionality, equivalent to using `if let` on `Binding` objects

## Requirements

Because of the nature of this feature, this has the same requirements as **SwiftUI**:

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## Installation

This can only be used (for now) as a SwiftPM package.

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

### As an app dependency

You can follow the instructions [here](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to learn how to add a Swift Package to your project from Xcode.

### As a package dependency

Once you have your Swift package set up, add this to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/baguio/SwiftUI-IfLet.git", from: "0.3.0")
]
```

## Usage

IfLet and IfBindingLet can only build one View at a time, but this view can be a View group (Groups, Stacks, etc)

### IfLet

```swift
let foo : String? = nil
```

```swift
VStack {
    IfLet(foo) { bar in
        VStack {
            Text("This won't appear because the variable used is nil")
            Text(bar)
        }
    }
    IfLet(foo, { bar in
        Text(bar)
    }, else: {
        Text("This text will appear, since the variable used is nil")
    })
}
```

### IfBindingLet

```swift
@State var foo : String? = nil
```

```swift
VStack {
    IfBindingLet($foo) { bar in
        VStack {
            Text("This won't appear because the variable used is nil")
            TextField("Input", text: bar)
        }
    }
    IfBindingLet($foo, { bar in
        TextField("Input", text: bar)
    }, else: {
        Text("This text will appear, since the variable used is nil")
    })
}
```

## License

SwiftUI-IfLet is released under the MIT license. [See LICENSE](https://github.com/baguio/SwiftUI-IfLet/blob/master/LICENSE) for details.
