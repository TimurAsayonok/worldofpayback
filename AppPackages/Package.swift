// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Module: String, CaseIterable {
    case WorldOfPaybackApp
//    case WorldOfPaybackAppTests
    case WorldOfPaybackAppComponents
    case WorldOfPaybackAppCoordinator
    case WorldOfPaybackAppCore
    case WorldOfPaybackModels
    case WorldOfPaybackAppTransactionsFeature
    case WorldOfPaybackAppWelcomeFeature
    case WorldOfPaybackServices
    case LocalizationStrings
    
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
                    .init(.WorldOfPaybackAppComponents),
                    .init(.WorldOfPaybackAppCoordinator),
                    .init(.WorldOfPaybackAppCore),
                    .init(.WorldOfPaybackModels),
                    .init(.WorldOfPaybackAppTransactionsFeature),
                    .init(.WorldOfPaybackAppWelcomeFeature),
                    .init(.LocalizationStrings),
                    .init(.WorldOfPaybackServices)
                ] + [
                    // External dependencies
                    .init(.ComposableArchitecture),
                    .init(.TCACoordinators)
                ]
            )
        case .WorldOfPaybackAppComponents:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackModels),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppCoordinator:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackModels),
                    .init(.WorldOfPaybackAppTransactionsFeature),
                    .init(.WorldOfPaybackAppWelcomeFeature),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppCore:
            return .target(
                name: rawValue,
                dependencies: []
            )
        case .WorldOfPaybackModels:
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
                    .init(.WorldOfPaybackModels),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackAppWelcomeFeature:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackModels),
                    .init(.LocalizationStrings)
                ]
            )
        case .WorldOfPaybackServices:
            return .target(
                name: rawValue,
                dependencies: [
                    .init(.WorldOfPaybackModels),
                    .init(.LocalizationStrings)
                ]
            )
        case .LocalizationStrings:
            return .target(
                name: rawValue,
                dependencies: [],
                resources: [.process("Resources")]
            )
        }
    }
    
    var testName: String {
        rawValue + "Tests"
    }
    
    var testTarget: Target? {
        switch self {
//        case .WorldOfPaybackAppCore:
//            return .target(
//                name: testName,
//                dependencies: []
//            )
//        case .WorldOfPaybackAppComponents:
//            return .target(
//                name: testName,
//                dependencies: []
//            )
            
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
