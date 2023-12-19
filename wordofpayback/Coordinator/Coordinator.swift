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
            routes: [.root(.welcome(.init()), embedInNavigationView: true)]
        )
        
        var routes: [Route<ScreenRoute.State>]
    }
    
    enum Action: IndexedRouterAction {
        case routeAction(Int, action: ScreenRoute.Action)
        case updateRoutes([Route<ScreenRoute.State>])
    }
    
    var body: some Reducer<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .welcome(.loginTapped)):
                state.routes.push(.welcome(.init()))
            default:
                break
            }
            
            return .none
        }.forEachRoute {
            ScreenRoute()
        }
    }
}
