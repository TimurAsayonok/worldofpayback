//
//  PrimaryButton.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
              .foregroundColor(.white)
              .padding()
              .frame(maxWidth: .infinity)
        }
        .background(Color(.purple))
        .cornerRadius(16)
    }
}

#Preview {
    PrimaryButton(title: "TestButton") {
        print("Test click")
    }
}
