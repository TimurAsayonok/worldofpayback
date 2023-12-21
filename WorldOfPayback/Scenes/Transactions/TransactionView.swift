//
//  TransactionView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import SwiftUI

struct TransactionView: View {
    var transaction: TransactionModel

    var body: some View {
        HStack {
            Text(String(transaction.partnerDisplayName?.first ?? "T"))
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.purple))
                }
            
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.partnerDisplayName ?? "")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.black)
                    
                    Text(transaction.transactionDetail?.description ?? "")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                    Text(transaction.transactionDetail?.getFormattedBookingData() ?? "")
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

#Preview {
    TransactionView(transaction: .mock())
}
