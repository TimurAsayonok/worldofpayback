// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Module: String, CaseIterable {
    case LocalizationStrings
    case WorldOfPaybackApp
    case WorldOfPaybackAppComponents
    case WorldOfPaybackAppCoordinator
    case WorldOfPaybackAppCore
    case WorldOfPaybackAppModels
    case WorldOfPaybackAppTransactionsFeature
    case WorldOfPaybackAppWelcomeFeature
    case WorldOfPaybackAppServices
    case WorldOfPaybackAppExtensions
    
    static var staticModules: [Module] = [.WorldOfPaybackApp]
    
    var product: Product {
        .library(
            name: rawValue,
            type: Self.staticModules.contains(self) ? .static : .dynamic,
            targets: [rawValue]
        )
    }
    
    var target: Target {
        switch self {
        case .WorldOfPaybackApp:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.LocalizationStrings),
                    .init(.WorldOfPaybackAppComponents),
                    .init(.WorldOfPaybackAppCoordinator),
                    .init(.WorldOfPaybackAppCore),
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppTransactionsFeature),
                    .init(.WorldOfPaybackAppWelcomeFeature),
                    .init(.WorldOfPaybackAppServices),
                    .init(.WorldOfPaybackAppExtensions)
                ] + [
                    // External dependencies
                    .init(.ComposableArchitecture),
                    .init(.TCACoordinators)
                ]
            )
        case .LocalizationStrings:
            return .target(
                name: rawValue,
                dependencies: [],
                resources: [.process("Resources")]
            )
        case .WorldOfPaybackAppComponents:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppExtensions),
                    .init(.LocalizationStrings),
                    .init(.ComposableArchitecture)
                ]
            )
        case .WorldOfPaybackAppCoordinator:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppTransactionsFeature),
                    .init(.WorldOfPaybackAppWelcomeFeature),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppCore:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppExtensions)
                ]
            )
        case .WorldOfPaybackAppModels:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppTransactionsFeature:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppComponents),
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppCore),
                    .init(.ComposableArchitecture),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppWelcomeFeature:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.WorldOfPaybackAppComponents),
                    .init(.WorldOfPaybackAppExtensions),
                    .init(.LocalizationStrings),
                    .init(.ComposableArchitecture)
                ]
            )
        case .WorldOfPaybackAppServices:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppExtensions:
            return .target(
                name: rawValue,
                dependencies: []
            )
        }
    }
    
    var testName: String {
        rawValue + "Tests"
    }
    
    var testTarget: Target? {
        switch self {
        case .WorldOfPaybackAppCore:
            return .testTarget(
                name: testName,
                dependencies: []
            )
        case .WorldOfPaybackAppComponents:
            return .testTarget(
                name: testName,
                dependencies: []
            )
        case .WorldOfPaybackAppModels:
            return .testTarget(
                name: testName,
                dependencies: [
                    .init(.WorldOfPaybackAppModels),
                    .init(.LocalizationStrings),
                    .init(.WorldOfPaybackAppExtensions)
                ]
            )
            
        default: return nil
        }
    }
}

enum Dependency: String, CaseIterable {
    case ComposableArchitecture
    case TCACoordinators
    
    var packageDependency: Package.Dependency {
        switch self {
        case .ComposableArchitecture: return .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.5.5")
        case .TCACoordinators: return .package(url: "https://github.com/johnpatrickmorgan/TCACoordinators", from: "0.8.0")
        }
    }
    
    var packageName: String {
        switch self {
        case .ComposableArchitecture: return "swift-composable-architecture"
        case .TCACoordinators: return "TCACoordinators"
        }
    }
}

extension Target.Dependency {
    init(_ module: Module) {
        self.init(stringLiteral: module.rawValue)
    }

    init(_ dependency: Dependency) {
        self = .product(name: dependency.rawValue, package: dependency.packageName)
    }
}

let package = Package(
    name: "AppPackages",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: Module.allCases.map(\.product),
    dependencies: Dependency.allCases.map(\.packageDependency),
    targets: Module.allCases.map(\.target) + Module.allCases.compactMap(\.testTarget)
)
