//
// Created by Hope on 2022/01/08.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .offset(y: 300)
            HStack {

                ForEach(tabItems) { (tabItem: TabItem) in
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
