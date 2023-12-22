//
//  CoordinatorView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct CoordinatorView: View {
    let store: StoreOf<Coordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen  in
                switch screen {
                case .welcome:
                    CaseLet(
                        /ScreenRoute.State.welcome,
                        action: ScreenRoute.Action.welcome,
                        then: WelcomeView.init
                    )
                case .transactionsList:
                    CaseLet(
                        /ScreenRoute.State.transactionsList,
                        action: ScreenRoute.Action.transactionsList,
                        then: TransactionsListView.init
                    )
                case .transactionItemDetails:
                    CaseLet(
                        /ScreenRoute.State.transactionItemDetails,
                        action: ScreenRoute.Action.transactionItemDetails,
                        then: TransactionDetailsView.init
                    )
                }
            }
        }
        .accentColor(.black)
    }
}
