//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/04.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 8.0) {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                        )
                        .background(
                                Image(systemName: "hexagon")
                                    .symbolVariant(.fill)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 200))
                                    .offset(x: -50, y: -100)
                        )
                    Text("Twosom")
                        .font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.large)
                        Text("Korea")
                            .foregroundColor(.secondary)
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding()


                Section {
                    Label("Settings", systemImage: "gear")
                    Label("Billing", systemImage: "creditcard")
                    Label("Help", systemImage: "questionmark")
                        .imageScale(.small)
                }
                    .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)

            }
                .listStyle(.insetGrouped)
                .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
