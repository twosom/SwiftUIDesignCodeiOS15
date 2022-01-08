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

    @State(initialValue: false)
    private var isPinned: Bool

    var body: some View {
        NavigationView {
            List {
                profile

                menu

                links

            }
                .listStyle(.insetGrouped)
                .navigationTitle("Account")

        }
    }

    var profile: some View {
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
                //                .background(
                //                        HexagonView()
                //                            .offset(x: -50, y: -100)
                //                )
                .background(
                        BlobView(colors: [.pink, .blue])
                            .offset(x: 200, y: 0)
                            .scaleEffect(0.6)
                            .blur(radius: 1)
                )
                .background(
                        BlobView(colors: [Color("AccentColor"), Color("AccentColor").opacity(0.4)],
                                customAnimation: .interactiveSpring().delay(15))
                            .offset(x: -400, y: 50)
                            .scaleEffect(0.2)
                            .blur(radius: 3)
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
            .foregroundStyle(.thinMaterial)
            .padding()
    }

    var menu: some View {
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

    }


    var links: some View {
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

                        pinButton

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
                .swipeActions {
                    pinButton
                }
        }
            .accentColor(.primary)
            .listRowSeparator(.hidden)
    }

    var pinButton: some View {
        Button {
            isPinned.toggle()
        } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
            .tint(isPinned ? .gray : .yellow)
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
