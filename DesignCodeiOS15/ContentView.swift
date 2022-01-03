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
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding()
            Text("SwiftUI for iOS15")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
            .padding(.all, 20)
            .padding(.vertical, 20)
            .frame(height: 350.0)
            .background(Color("Background"))
            .cornerRadius(30.0)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .padding(.horizontal, 20)


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewDevice("iPhone 13 mini")
        }
    }
}
