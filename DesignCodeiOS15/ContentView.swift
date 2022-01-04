//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/03.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)

            Text("SwiftUI for iOS 15")
                .font(.largeTitle.bold())
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)

            Text("20 sections - 3 hours".uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animation and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)

        }
            .padding(.all, 20)
            .padding(.vertical, 20)
            .frame(height: 350)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .strokeStyle()
            .padding(.horizontal, 20)
            .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -100)
            )
            .overlay(
                    Image("Illustration 5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 230)
                        .offset(x: 32, y: -100)

            )


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13 mini")
        }
    }
}
