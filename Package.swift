// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RPGDiceCalculator",
    platforms: [
        .iOS("14.0"),
        .macOS("11.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RPGDiceCalculator",
            targets: ["RPGDiceCalculator"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RPGDiceCalculator",
            dependencies: []),
        .testTarget(
            name: "RPGDiceCalculatorTests",
            dependencies: ["RPGDiceCalculator"]),
    ]
)

//Package(name: <#T##String#>, defaultLocalization: <#T##LanguageTag?#>, platforms: <#T##[SupportedPlatform]?#>, pkgConfig: <#T##String?#>, providers: <#T##[SystemPackageProvider]?#>, products: <#T##[Product]#>, dependencies: <#T##[Package.Dependency]#>, targets: <#T##[Target]#>, swiftLanguageVersions: <#T##[SwiftVersion]?#>, cLanguageStandard: <#T##CLanguageStandard?#>, cxxLanguageStandard: <#T##CXXLanguageStandard?#>)
