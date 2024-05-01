// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.macOS(.v10_13)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", exact: "0.53.8"),
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
