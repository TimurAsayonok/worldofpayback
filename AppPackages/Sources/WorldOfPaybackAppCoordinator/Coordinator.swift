//
//  Coordinator.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import WorldOfPaybackAppWelcomeFeature
import WorldOfPaybackAppTransactionsFeature
import TCACoordinators

public struct Coordinator: Reducer {
    public struct State: Equatable, IndexedRouterState {
        public static let initialState = State(
            routes: [.root(.welcome(.init()), embedInNavigationView: true)]
        )
        
        public var routes: [Route<ScreenRoute.State>]
        
        public init(routes: [Route<ScreenRoute.State>]) {
            self.routes = routes
        }
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: ScreenRoute.Action)
        case updateRoutes([Route<ScreenRoute.State>])
    }
    
    public var body: some Reducer<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .welcome(.loginTapped)):
                state.routes.push(.transactionsList(.init()))
            case .routeAction(_, action: .transactionsList(.transactionItemTapped(let transaction))):
                state.routes.push(.transactionItemDetails(.init(transaction: transaction)))
            default:
                break
            }
            
            return .none
        }.forEachRoute {
            ScreenRoute()
        }
    }
    
    public init() {}
}
