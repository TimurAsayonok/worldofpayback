//
//  Created by Tsimur Asayonak on 12/21/23.
//

import SwiftUI
import WorldOfPaybackAppModels
import WorldOfPaybackAppComponents

public struct TransactionView: View {
    var transaction: TransactionModel
    
    public init(transaction: TransactionModel) {
        self.transaction = transaction
    }

    public var body: some View {
        HStack {
            TransactionLogoView(transactionName: transaction.partnerDisplayName)
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.partnerDisplayName ?? "")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.black)
                    
                    Text(transaction.transactionDetail?.description ?? "")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                    Text(transaction.transactionDetail?.bookingDate?.timestamp
                         ?? "")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                Text(transaction.transactionDetail?.value?.formattedValue ?? "")
                    .font(.callout)
                    .bold()
                    .foregroundStyle(.black)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
    }
}
