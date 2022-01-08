//
// Created by Hope on 2022/01/08.
//

import SwiftUI

struct TabBar: View {

    @State(initialValue: Tab.HOME)
    private var selectedTab: Tab

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
                        selectedTab = tabItem.tab
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
                        .foregroundStyle(selectedTab == tabItem.tab ? .primary : .secondary)

                }

            }
                .padding(.horizontal, 8)
                .padding(.top, 14)
                .frame(height: 88, alignment: .top)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
                .strokeStyle(cornerRadius: 34)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
        }

    }


}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
