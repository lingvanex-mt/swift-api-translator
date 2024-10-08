// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Lingvanex",
    products: [
        .library(
            name: "Lingvanex",
            targets: ["Lingvanex"]),
    ],
    dependencies: [
        // Add your dependencies here
    ],
    targets: [
        .target(
            name: "Lingvanex",
            dependencies: []),
        .testTarget(
            name: "LingvanexTests",
            dependencies: ["Lingvanex"]),
    ]
)
