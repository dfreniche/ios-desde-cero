import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/pakLebah/ANSITerminal", requirement: .upToNextMajor(from: "0.0.3")),
        .remote(url: "https://github.com/JohnSundell/Files", requirement: .upToNextMajor(from: "4.0.0")),
        .remote(url: "https://github.com/apple/swift-argument-parser", requirement: .upToNextMajor(from: "1.1.4")),
        .remote(url: "https://github.com/dfreniche/SwiftFiglet", requirement: .upToNextMajor(from: "0.2.1")),

    ],
    platforms: [.macOS]
)

