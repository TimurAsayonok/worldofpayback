//
//  TransactionDetailsView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import SwiftUI

struct TransactionDetailsView: View {
    let store: StoreOf<TransactionDetailsStore>
    
    var body: some View {
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

struct TransactionDetailsStore: Reducer {
    struct State: Equatable {
        var transaction: TransactionModel
    }
    
    enum Action: Equatable {}
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
