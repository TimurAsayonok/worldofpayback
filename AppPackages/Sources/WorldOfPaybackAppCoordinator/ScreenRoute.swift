//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import WorldOfPaybackAppWelcomeFeature
import WorldOfPaybackAppTransactionsFeature

public struct ScreenRoute: Reducer {
    public enum State: Equatable {
        case welcome(WelcomeStore.State)
        case transactionsList(TransactionListStore.State)
        case transactionItemDetails(TransactionDetailsStore.State)
    }
    
    public enum Action: Equatable {
        case welcome(WelcomeStore.Action)
        case transactionsList(TransactionListStore.Action)
        case transactionItemDetails(TransactionDetailsStore.Action)
    }
    
    public var body: some Reducer<State, Action> {
        Scope(state: /State.welcome, action: /Action.welcome) {
            WelcomeStore()
        }
        Scope(state: /State.transactionsList, action: /Action.transactionsList) {
            TransactionListStore()
        }
        Scope(state: /State.transactionItemDetails, action: /Action.transactionItemDetails) {
            TransactionDetailsStore()
        }
    }
}
