//
//  TransactionDetailsView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackAppModels
import WorldOfPaybackAppComponents

public struct TransactionDetailsView: View {
    let store: StoreOf<TransactionDetailsStore>
    
    public init(store: StoreOf<TransactionDetailsStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            let transaction = viewStore.state.transaction
            
            VStack(alignment: .center) {
                TransactionLogoView(
                    transactionName: transaction.partnerDisplayName,
                    size: CGSize(width: 140, height: 140)
                )
                
                VStack(alignment: .leading) {
                    Text(transaction.partnerDisplayName ?? "")
                        .font(.title)
                        .bold()
                    
                    Text(transaction.transactionDetail?.description ?? "")
                        .font(.callout)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

public struct TransactionDetailsStore: Reducer {
    public struct State: Equatable {
        public var transaction: TransactionModel
        
        public init(transaction: TransactionModel) {
            self.transaction = transaction
        }
    }
    
    public enum Action: Equatable {}
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
    
    public init() {}
}
