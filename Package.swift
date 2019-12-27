// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI > IfLet",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SwiftUIIfLet",
            targets: ["SwiftUIIfLet"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftUIIfLet",
            dependencies: []),
        .testTarget(
            name: "SwiftUIIfLetTests",
            dependencies: ["SwiftUIIfLet"]),
    ]
)
