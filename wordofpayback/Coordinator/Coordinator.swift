//
//  coordinator.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import TCACoordinators

struct Coordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        static let initialState = State(
            routes: [.root(.home(.init()), embedInNavigationView: true)]
        )
        
        var routes: [Route<Screen.State>]
    }
    
    enum Action: IndexedRouterAction {
        case routeAction(Int, action: Screen.Action)
        case updateRoutes([Route<Screen.State>])
    }
    
    var body: some Reducer<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .home(.loginTapped)):
                state.routes.push(.home(.init()))
            default:
                break
            }
            
            return .none
        }.forEachRoute {
            Screen()
        }
    }
}
