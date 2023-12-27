//
//  TransactionLogoView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import SwiftUI
import WorldOfPaybackAppExtensions

public struct TransactionLogoView: View {
    var transactionName: String?
    var size: CGSize
    
    public init(
        transactionName: String? = nil,
        size: CGSize = CGSize(width: 80, height: 80)
    ) {
        self.transactionName = transactionName
        self.size = size
    }
    
    public var body: some View {
        Text(String(transactionName?.first?.uppercased() ?? "T"))
            .font(.title)
            .bold()
            .foregroundStyle(.white)
            .frame(width: size.width, height: size.height)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondaryColor)
            }
    }
}

#Preview {
    TransactionLogoView(transactionName: "Name")
}
