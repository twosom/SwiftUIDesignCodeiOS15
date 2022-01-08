//
// Created by Hope on 2022/01/08.
//

import SwiftUI

struct TabBar: View {

    @State(initialValue: Tab.HOME)
    private var selectedTab: Tab

    @State(initialValue: Color.teal)
    private var color: Color

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .HOME:
                    ContentView()
                case .EXPLORE:
                    AccountView()
                default:
                    ContentView()
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack {

                ForEach(tabItems) { (tabItem: TabItem) in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = tabItem.tab
                            color = tabItem.color
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: tabItem.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(tabItem.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                            .frame(maxWidth: .infinity)

                    }
                        .foregroundStyle(isSelected(tabItem) ? .primary : .secondary)
                        .blendMode(isSelected(tabItem) ? .overlay : .normal)

                }

            }
                .padding(.horizontal, 8)
                .padding(.top, 14)
                .frame(height: 88, alignment: .top)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
                .background(
                        HStack {
                            if selectedTab == .LIBRARY {
                                Spacer()
                            } else if selectedTab == .EXPLORE {
                                Spacer()
                            } else if selectedTab == .NOTIFICATIONS {
                                Spacer()
                                Spacer()
                            }
                            Circle()
                                .fill(color)
                                .frame(width: 80)

                            if selectedTab == .HOME {
                                Spacer()
                            } else if selectedTab == .EXPLORE {
                                Spacer()
                                Spacer()
                            } else if selectedTab == .NOTIFICATIONS {
                                Spacer()
                            }

                        }
                            .padding(.horizontal, 8)


                )
                .overlay(
                        HStack {
                            if selectedTab == .LIBRARY {
                                Spacer()
                            } else if selectedTab == .EXPLORE {
                                Spacer()
                            } else if selectedTab == .NOTIFICATIONS {
                                Spacer()
                                Spacer()
                            }
                            Rectangle()
                                .fill(color)
                                .frame(width: 28, height: 5)
                                .cornerRadius(3)
                                .frame(width: 88)
                                .frame(maxHeight: .infinity, alignment: .top)

                            if selectedTab == .HOME {
                                Spacer()
                            } else if selectedTab == .EXPLORE {
                                Spacer()
                                Spacer()
                            } else if selectedTab == .NOTIFICATIONS {
                                Spacer()
                            }

                        }
                            .padding(.horizontal, 8)


                )
                .strokeStyle(cornerRadius: 34)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
        }

    }

    private func isSelected(_ tabItem: TabItem) -> Bool {
        selectedTab == tabItem.tab
    }


}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
