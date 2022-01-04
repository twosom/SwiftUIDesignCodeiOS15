//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/04.
//

import SwiftUI

struct AccountView: View {

    @State(initialValue: false)
    private var isDeleted: Bool

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
                                    .foregroundStyle(
                                            .linearGradient(
                                                    colors: [Color("AccentColor").opacity(0.1),
                                                             Color("AccentColor").opacity(1)],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)

                                    )
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
                    NavigationLink(destination: ContentView()) {
                        Label("Settings", systemImage: "gear")
                    }
                    NavigationLink {
                        Text("Billing")
                    } label: {
                        Label("Billing", systemImage: "creditcard")
                    }
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Help", systemImage: "questionmark")
                            .imageScale(.small)
                    }
                }
                    .accentColor(.primary)
                    .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)

                Section {
                    if !isDeleted {
                        Link(destination: URL(string: "https://apple.com")!) {
                            HStack {
                                Label("Apple Website", systemImage: "house")
                                Spacer()
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                            .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
                                Button {
                                    isDeleted = true
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                    .tint(.red)

                                Button {

                                } label: {
                                    Label("Pin", systemImage: "pin")
                                }
                                    .tint(.yellow)
                            })
                    }


                    Link(destination: URL(string: "https://youtube.com")!) {
                        HStack {
                            Label("YouTube", systemImage: "tv")
                            Spacer()
                            Image(systemName: "link")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                    .accentColor(.primary)
                    .listRowSeparator(.hidden)

            }
                .listStyle(.insetGrouped)
                .navigationTitle("Account")

        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
            AccountView()
                .preferredColorScheme(.dark)
        }
    }
}
