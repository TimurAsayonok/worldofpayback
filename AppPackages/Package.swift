// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Module: String, CaseIterable {
    case WorldOfPaybackApp
//    case WorldOfPaybackAppTests
    case WorldOfPaybackAppComponents
    case WorldOfPaybackAppCore
    
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
                    .init(.WorldOfPaybackAppCore)
                ] + [
                    // External dependencies
                    .init(.ComposableArchitecture),
                    .init(.TCACoordinators)
                ]
            )
        case .WorldOfPaybackAppComponents:
            return .target(
                name: rawValue,
                dependencies: []
            )
        case .WorldOfPaybackAppCore:
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

//enum Submodule: String {
//    
//}

extension Target.Dependency {
    init(_ module: Module) {
        self.init(stringLiteral: module.rawValue)
    }

    init(_ dependency: Dependency) {
        self = .product(name: dependency.rawValue, package: dependency.packageName)
    }

//    init(_ dependency: Submodule) {
//        self = .product(name: dependency.rawValue, package: dependency.packageName)
//    }
}

let package = Package(
    name: "AppPackages",
    platforms: [.iOS(.v17)],
    products: Module.allCases.map(\.product),
    dependencies: Dependency.allCases.map(\.packageDependency),
    targets: Module.allCases.map(\.target) + Module.allCases.compactMap(\.testTarget)
)
