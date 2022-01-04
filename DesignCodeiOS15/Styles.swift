//
//  SwiftUIView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/04.
//

import SwiftUI

struct StrokeStyle: ViewModifier {

    var cornerRadius: CGFloat

    @Environment(\.colorScheme)
    var colorScheme: ColorScheme

    func body(content: Content) -> some View {
        content
            .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(
                                .linearGradient(
                                        colors: [.white.opacity(isDarkMode() ? 0.6 : 0.3),
                                                 .black.opacity(isDarkMode() ? 0.3 : 0.1)],
                                        startPoint: .top,
                                        endPoint: .bottom
                                )
                        )
                        .blendMode(.overlay)
            )
    }

    private func isDarkMode() -> Bool {
        colorScheme == .dark
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        self.modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}