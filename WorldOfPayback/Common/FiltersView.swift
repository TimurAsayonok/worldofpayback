//
//  FiltersView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import SwiftUI

struct FiltersView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sort By:")
                    .font(.headline)
                HStack {
                    Button(action: {}) {
                        Text("Up")
                            .padding(12)
                            .foregroundStyle(.purple)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 16,
                                    style: .continuous
                                )
                                .stroke(.purple, lineWidth: 2)
                            )
                    }
                    Button(action: {}) {
                        Text("Down")
                            .padding(12)
                            .foregroundStyle(.purple)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 16,
                                    style: .continuous
                                )
                                .stroke(.purple, lineWidth: 2)
                            )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
        
                Text("Cathegory")
                    .font(.headline)
                
                HStack {
                    ForEach(1..<4) { number in
                        Button(action: {}) {
                            Text("\(number)")
                                .padding(12)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 16,
                                        style: .continuous
                                    )
                                    .stroke(.gray, lineWidth: 2)
                                )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    FiltersView()
}
