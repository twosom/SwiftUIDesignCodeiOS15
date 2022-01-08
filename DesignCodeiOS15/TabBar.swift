//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/08.
//

import SwiftUI

struct TabBar: View {

    private let cornerRadius: CGFloat = 34

    @State(initialValue: Tab.HOME)
    private var selectedTab: Tab

    @State(initialValue: Color.teal)
    private var color: Color

    @State(initialValue: 0)
    private var tabItemWidth: CGFloat

    var body: some View {
        ZStack(alignment: .bottom) {
            selectedView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                buttons
            }
                .padding(.horizontal, 8)
                .padding(.top, 14)
                .frame(height: 88, alignment: .top)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                .background(
                        background
                )
                .strokeStyle(cornerRadius: cornerRadius)
                .overlay(
                        overlay
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()

        }

    }

    var buttons: some View {
        ForEach(tabItems) { tabItem in
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
                .foregroundStyle(isSelected(tab: tabItem.tab) ? .primary : .secondary)
                .blendMode(isSelected(tab: tabItem.tab) ? .overlay : .normal)
                .overlay(
                        GeometryReader { proxy in
                            Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                        }
                )
                .onPreferenceChange(TabPreferenceKey.self) { value in
                    self.tabItemWidth = value
                }
        }
    }
    var overlay: some View {
        HStack {
            if selectedTab == .LIBRARY || selectedTab == .EXPLORE {
                Spacer()
            }

            if selectedTab == .NOTIFICATIONS {
                Spacer()
                Spacer()
            }

            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)

            if selectedTab == .HOME || selectedTab == .NOTIFICATIONS {
                Spacer()
            }
            if selectedTab == .EXPLORE {
                Spacer()
                Spacer()
            }
        }
            .padding(.horizontal, 8)
            .frame(maxHeight: .infinity, alignment: .top)

    }

    var background: some View {
        HStack {
            if selectedTab == .LIBRARY || selectedTab == .EXPLORE {
                Spacer()
            }

            if selectedTab == .NOTIFICATIONS {
                Spacer()
                Spacer()
            }

            Circle().fill(color).frame(width: tabItemWidth)
            if selectedTab == .HOME || selectedTab == .NOTIFICATIONS {
                Spacer()
            }
            if selectedTab == .EXPLORE {
                Spacer()
                Spacer()
            }
        }
            .padding(.horizontal, 8)
    }

    private func isSelected(tab: Tab) -> Bool {
        selectedTab == tab
    }

    private func selectedView() -> some View {
        Group {
            switch selectedTab {
            case .HOME:
                ContentView()
            case .EXPLORE:
                AccountView()
            case .NOTIFICATIONS:
                ContentView()
            case .LIBRARY:
                AccountView()
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
